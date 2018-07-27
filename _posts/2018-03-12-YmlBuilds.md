---
layout: post
title: "Visual Studio Team Systems (VSTS) yml style builds"
description: "Creating YML build for VSTS"
categories: build
author: "Chris Hudson"
meta: "Build"
---

Assumptions:
- You are using VSTS for your source control and build systems.
- You have a hosted vs 2017 build
- You have a 2.0 .net core webapp

# Yml style builds in VSTS
I don't like asking someone/something to create a build for my applications. So I was supper excited when i heard Microsoft announce CI builds using yml files ["How to use YAML builds"](https://docs.microsoft.com/en-us/vsts/build-release/actions/build-yaml). It is currently in preview mode at the time of writing so make sure you have that preview feature enabled.

- First cool thing: 
The yml file resides with your code base on your master branch. This allows gives you all the advantages of version control. 

- Second cool thing: 
Builds are kicked off automatically on check in to master branch (hello [CI/CD](https://docs.wixstatic.com/ugd/4b1498_3f52c2a6684c4e0d9b98416da75a0b9a.pptx?dn=Continuous_Integration_%E2%80%93_Continuous_Delivery_Tool_Chain.pptx) I love you so)

## First things first... 
- create a file named **.vsts-ci.yml**  it has to specifically be named this.
- It also has to reside in the root folder of the repo in the master branch (just like the git ignore file)
- deployment steps require a Service Endpoint to be created in VSTS under Default Team Settings >> Services >> New Service Endpoint for your Azure subscription information mine is named ```ConnectedServiceName: "Azure1"```
- multiple phases hasn't been implemented yet.
- I have full debug turned on with the setting 
```"system.debug" : "true"```

# This is an example of CI/CD yml file (all the way to prod) 
- extracts all environment variables to a mark down file and attaches it to build output
- nuget restore
- Donet restore - we had issues where donet restore wouldnt bring back all the packages needed thus we have both nuget and dotnet YMMV
- Compiles and packages the app for msdeploy style deployment
- runs all unit tests (you did do TDD for this app right)
- Stops staging slot in the webapp (with a 1 minute time out)
- Then we stop any webjobs that are running (app insights doesnt like to give up on us, so we forcefully stop the webjobs)
- Finally we can deploy the app
- We force app insights just in case someone forgot the nuget packages in the app
- Start the webjobs, and the site again
- then we swap the slots for the TESTing environment (allows for zero down time deployments)
- All integration tests are then run 
- Prod deployment follows the same steps as test including the swap slots step.
- we then publish the pdb's so we can debug if we need to.
- we publish the artifacts (basically everything in the deployment directory)
- My existing client wants all the artifacts published to Artifactory as well for their binary repository. 


Example file,   
.vsts-ci.yml
----------
```
phases:
  - phase: Build
  displayName: Build
  variables:
	    "ApplicationBaseName" : "<APPNAME>"
	    "ApplicationType" : "<APPTYPE>"
	    "ApplicationTestDllPathUnit" : "**/*.Test.Unit.dll"
	    "ApplicationFrameWorkVersion" : "/framework:.NETCoreApp,Version=v2.0"
	    "ApplicationTestRunSettingsPath" : "Test.RunSettings"
	    "ApplicationBuildConfiguration" : "release"
	    "ApplicationBuildPlatform" : "Any CPU"
	    "ApplicationBlockCoverageThreshold": "80"
	    #Standard Names
	    "StandardNameTestPrefix" : "<COMPANY>-TEST-"
	    "StandardNameProdPrefix" : "<COMPANY>-PROD-"
	    "StandardNameResourceGroupSuffix" : "-rsg"
	    "StandardNameSourceSlot": "staging"
	    #Naming Formats
	    "FormattedAppName" : "$(ApplicationType)-$(ApplicationBaseName)"
	    "FormattedAppNameTestEnv": "$(StandardNameTestPrefix)$(FormattedAppName)"
	    "FormattedRsgNameTestEnv": "$(FormattedAppNameTestEnv)$(StandardNameResourceGroupSuffix)"
	    "FormattedAppNameProdEnv": "$(StandardNameProdPrefix)$(FormattedAppName)"
	    "FormattedRsgNameProdEnv": "$(FormattedAppNameProdEnv)$(StandardNameResourceGroupSuffix)"
	    #System Variables
	    "SystemPackageSystemUri" : "https://api.nuget.org"
	    "SystemPackageRemoteRepo" : "/v3/index.json"
	    "SystemPackageBaseTargetRepo" : "<COMPANY>-app"
	    "SystemVstestPath": "C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\Enterprise\\Common7\\IDE\\Extensions\\TestPlatform\\"
	    "SystemTestDeployedUrl" : "TestDeployedUrl"
	    "SystemProdDeployedUrl" : "ProdDeployedUrl"
	    #Full Debug Logging
	    "system.debug" : "true"
  
  queue: 
    name: "Hosted VS2017"
    demands: 
      - msbuild
      - visualstudio
      - vstest

  steps: 
  - task: PowerShell@2
    displayName: List Environment Variables
    inputs:
      targetType: "inline"
      script: |
        Write-Host "This agent is running PowerShell v$($PSVersionTable.PSVersion.Major)"
        $var = (gci env:*).GetEnumerator() | Sort-Object Name
        $out = ""
        Foreach ($v in $var) {$out = $out + "`t{0,-28} = {1,-28}`n" -f $v.Name, $v.Value}
        write-output "dump variables on $env:BUILD_ARTIFACTSTAGINGDIRECTORY\environnment.md"
        $fileName = "$env:AGENT_TEMPDIRECTORY\Environment.md"
        set-content $fileName $out
        write-output "##vso[task.addattachment type=Distributedtask.Core.Summary;name=Environment Variables;]$fileName"
      errorActionPreference: "continue"
      ignoreLASTEXITCODE: "true"
    
  - task: NuGetToolInstaller@0
    displayName: Install Nuget
    inputs:
      timeoutInMinutes: 1
  
  - task: NuGetCommand@2
    displayName: NuGet Restore
    inputs: 
      arguments: 'restore -Source "$(SystemPackageSystemUri)$(SystemPackageRemoteRepo)"'
      command: custom
      includeNuGetOrg: "false"
      vstsFeed: $(SystemPackageSystemUri)
  
  - task: DotNetCoreCLI@1
    displayName: DotNet Restore
    inputs:
      command: "restore"
      projects: '**\*.csproj'
      arguments: "-s $(SystemPackageSystemUri)$(SystemPackageRemoteRepo)"  

  - task: VSBuild@1
    displayName: Build Solution
    inputs: 
      configuration: "$(ApplicationBuildConfiguration)"
      platform: "$(ApplicationBuildPlatform)"
      msbuildArgs: "/p:DeployOnBuild=true /p:WebPublishMethod=Package /p:PackageAsSingleFile=true /p:SkipInvalidConfigurations=true /p:PackageLocation=$(build.artifactstagingdirectory) /m"
      solution: '**\*.sln'
  
  - task: VSTest@2
    displayName: Unit Tests
    inputs: 
      codeCoverageEnabled: "true"
      configuration: $(ApplicationBuildConfiguration)
      platform: $(ApplicationBuildPlatform)
      otherConsoleOptions: $(ApplicationFrameWorkVersion)
      runInParallel: "true"
      vstestLocation: $(SystemVstestPath)
      vstestLocationMethod: location
      testAssemblyVer2: |
        $(ApplicationTestDllPathUnit)
        !**/*TestAdapter.dll
        !**/\obj\**
      runSettingsFile: $(ApplicationTestRunSettingsPath)

    #- phase: Deployment
    #  displayName: Deployment and Integration Test
    #  dependsOn: Build
    #  condition: and(succeeded(), eq(variables['build.sourceBranch'], 'refs/heads/master'))
    #  steps:
  
  #Stop App Service
  - task: AzureAppServiceManage@0
    displayName: Stop App Service Test
    continueOnError: true
    inputs:
      ConnectedServiceName: "Azure1"
      Action: "Stop Azure App Service"
      WebAppName: $(FormattedAppNameTestEnv)
      SpecifySlot: "true"
      ResourceGroupName: "$(FormattedRsgNameTestEnv)"
      Slot: "$(StandardNameSourceSlot)"
      timeoutInMinutes: 1

  #Stop Webjobs Service
  - task: AzureAppServiceManage@0
    displayName: Stop Any Webjobs Service Test
    continueOnError: true
    inputs:
      ConnectedServiceName: "Azure1"
      Action: "Stop all continuous webjobs"
      WebAppName: $(FormattedAppNameTestEnv)
      SpecifySlot: "true"
      ResourceGroupName: "$(FormattedRsgNameTestEnv)"
      Slot: "$(StandardNameSourceSlot)"
      timeoutInMinutes: 2

  #Deploy
  - task: AzureRmWebAppDeployment@3
    displayName: Deploy Test
    inputs:
      ConnectedServiceName: Azure1
      WebAppName: $(FormattedAppNameTestEnv)
      DeployToSlotFlag: "true"
      ResourceGroupName: $(FormattedRsgNameTestEnv)
      SlotName: $(StandardNameSourceSlot)
      WebAppUri: $(SystemTestDeployedUrl)
      Package : "$(Build.ArtifactStagingDirectory)/**/*.zip"
      TakeAppOfflineFlag: "true"
      UseWebDeploy: "true"
      RemoveAdditionalFilesFlag: "true"
      AdditionalArguments: "-skip:objectName=filePath,absolutePath=parameters.xml -retryAttempts:20"
      ExcludeFilesFromAppDataFlag: "true"

  #Start App Service
  - task: AzureAppServiceManage@0
    displayName: Start App Service Test
    inputs:
      ConnectedServiceName: "Azure1"
      Action: "Start Azure App Service"
      WebAppName: $(FormattedAppNameTestEnv)
      SpecifySlot: "true"
      ResourceGroupName: "$(FormattedRsgNameTestEnv)"
      Slot: "$(StandardNameSourceSlot)"      
  
  #Ensure App Insights - May restart site
  - task: AzureAppServiceManage@0
    displayName: Ensure App Insights Installed
    inputs:
      ConnectedServiceName: "Azure1"
      Action: "Install Extensions"
      WebAppName: "$(FormattedAppNameTestEnv)"
      SpecifySlot: "true"
      ResourceGroupName: "$(FormattedRsgNameTestEnv)"
      Slot: "$(StandardNameSourceSlot)"  
      ExtensionsList: "Microsoft.ApplicationInsights.AzureWebSites"

  #Start Web Jobs
  - task: AzureAppServiceManage@0
    displayName: Start Web Jobs Test
    inputs:
      ConnectedServiceName: "Azure1"
      Action: "Start all continuous webjobs"
      WebAppName: $(FormattedAppNameTestEnv)
      SpecifySlot: "true"
      ResourceGroupName: "$(FormattedRsgNameTestEnv)"
      Slot: "$(StandardNameSourceSlot)"       

  #Swap slots
  - task: AzureAppServiceManage@0
    displayName: Swap Slot Test
    inputs:
      ConnectedServiceName: Azure1
      WebAppName: $(FormattedAppNameTestEnv)
      ResourceGroupName: $(FormattedRsgNameTestEnv)
      SourceSlot: $(StandardNameSourceSlot)

  #Integration Tests
  - task: VSTest@2
    displayName: Integration Tests
    inputs: 
      codeCoverageEnabled: "true"
      configuration: $(ApplicationBuildConfiguration)
      platform: $(ApplicationBuildPlatform)
      otherConsoleOptions: $(ApplicationFrameWorkVersion)
      runInParallel: "false"
      vstestLocation: $(SystemVstestPath)
      vstestLocationMethod: location
      testAssemblyVer2: |
        $(ApplicationTestDllPathIntegration)
        !**/*TestAdapter.dll
        !**/\obj\**
      runSettingsFile: $(ApplicationTestRunSettingsPath)

  #- phase: ProdDeployment
  #Stop App Service
  - task: AzureAppServiceManage@0
    displayName: Stop App Service Prod
    continueOnError: true
    inputs:
      ConnectedServiceName: "Azure1"
      Action: "Stop Azure App Service"
      WebAppName: $(FormattedAppNameProdEnv)
      SpecifySlot: "true"
      ResourceGroupName: "$(FormattedRsgNameProdEnv)"
      Slot: "$(StandardNameSourceSlot)"
      timeoutInMinutes: 1

  #Stop Webjobs Service
  - task: AzureAppServiceManage@0
    displayName: Stop Any Webjobs Service Prod
    continueOnError: true
    inputs:
      ConnectedServiceName: "Azure1"
      Action: "Stop all continuous webjobs"
      WebAppName: $(FormattedAppNameProdEnv)
      SpecifySlot: "true"
      ResourceGroupName: "$(FormattedRsgNameProdEnv)"
      Slot: "$(StandardNameSourceSlot)" 
      timeoutInMinutes: 2

  #Deploy
  - task: AzureRmWebAppDeployment@3
    displayName: Deploy Prod
    inputs:
      ConnectedServiceName: Azure1
      WebAppName: $(FormattedAppNameProdEnv)
      DeployToSlotFlag: "true"
      ResourceGroupName: $(FormattedRsgNameProdEnv)
      SlotName: $(StandardNameSourceSlot)
      WebAppUri: $(SystemProdDeployedUrl)
      Package : "$(Build.ArtifactStagingDirectory)/**/*.zip"
      TakeAppOfflineFlag: "true"
      UseWebDeploy: "true"
      RemoveAdditionalFilesFlag: "true"
      AdditionalArguments: "-skip:objectName=filePath,absolutePath=parameters.xml -retryAttempts:20"
      ExcludeFilesFromAppDataFlag: "true"

  #Start App Service
  - task: AzureAppServiceManage@0
    displayName: Start App Service Prod
    inputs:
      ConnectedServiceName: "Azure1"
      Action: "Start Azure App Service"
      WebAppName: $(FormattedAppNameProdEnv)
      SpecifySlot: "true"
      ResourceGroupName: "$(FormattedRsgNameProdEnv)"
      Slot: "$(StandardNameSourceSlot)"      
  
  #Ensure App Insights - May restart site
  - task: AzureAppServiceManage@0
    displayName: Ensure App Insights Installed
    inputs:
      ConnectedServiceName: "Azure1"
      Action: "Install Extensions"
      WebAppName: "$(FormattedAppNameProdEnv)"
      SpecifySlot: "true"
      ResourceGroupName: "$(FormattedRsgNameProdEnv)"
      Slot: "$(StandardNameSourceSlot)"  
      ExtensionsList: "Microsoft.ApplicationInsights.AzureWebSites"

  #Start Web Jobs
  - task: AzureAppServiceManage@0
    displayName: Start Web Jobs Prod
    inputs:
      ConnectedServiceName: "Azure1"
      Action: "Start all continuous webjobs"
      WebAppName: $(FormattedAppNameProdEnv)
      SpecifySlot: "true"
      ResourceGroupName: "$(FormattedRsgNameProdEnv)"
      Slot: "$(StandardNameSourceSlot)"       

  #Swap slots
  - task: AzureAppServiceManage@0
    displayName: Swap Slot Prod
    inputs:
      ConnectedServiceName: Azure1
      WebAppName: $(FormattedAppNameProdEnv)
      ResourceGroupName: $(FormattedRsgNameProdEnv)
      SourceSlot: $(StandardNameSourceSlot)

  #- phase: PublishArtifacts
  - task: PublishSymbols@1
    displayName: Publishing Symbols
    inputs:
      SymbolsPath: "$(build.artifactstagingdirectory)"
      SearchPattern: '**\bin\**\*.pdb'
  
  - task: PublishBuildArtifacts@1
    displayName: Artifacts for TFS
    inputs:
      PathtoPublish: '$(build.artifactstagingdirectory)'
      ArtifactName: "drop"
      ArtifactType: "Container"

  - task: ArchiveFiles@1
    displayName: Zipping Files
    inputs:
      rootFolder: "$(build.artifactstagingdirectory)"
      includeRootFolder: "false"
      archiveFile: '$(Build.ArtifactStagingDirectory)\$(Build.BuildNumber).zip'

  - task: JFrog.jfrog-artifactory.jfrog-artifactory-deployer-build-task.JFrogArtifactoryDeployer@2
    displayName: Artifactory Upload
    inputs:
      artifactoryEndpointName: Artifactory
      targetRepo: '$(SystemPackageBaseTargetRepo)/$(Build.Repository.Name)/$(Build.BuildNumber).zip'
      contents: '$(Build.ArtifactStagingDirectory)\$(Build.BuildNumber).zip'
# Schema: https://github.com/Microsoft/vsts-agent/blob/master/docs/preview/yamlgettingstarted-schema.md
```