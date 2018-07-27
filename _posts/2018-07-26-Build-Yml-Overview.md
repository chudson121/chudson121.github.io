---
layout: post
title: "VSTS Build Files"
description: "Overview and description of VSTS Yml files"
categories: Build Engineering
author: "Chris Hudson"
meta: "VSTS, Build Pipelines, Infrastructure as Code, Build as Code"
---

# .Net Core - VSTS yml build files.

# Overview:
Pipeline as code allow self-service capability to the Dev team to create and maintain their application builds. The build pipeline becomes part of Source Control allowing easy and familiar revisions. At an enterprise level make the standard build file generic with minimal amount of changes needed for app dev, with the flexibility that the developer may make edits where and when needed. The build file defaults for full Continuous Delivery of applications.

# Filename must be: .vsts-ci.yml
It must reside in the root of the repository
Space character sensitive! Do not use tabs (\t).

## Variables:
# Application Variables
Used to specify information needed for the specific application
Examples:

	"Application.Settings.BaseName" : "MyCoolApp"
	"Application.Settings.Type" : "API"

# Standard Names
Used for enterprise level naming conventions
Example:
	"Enterprise.Repos.BuildUtility" : "ReleaseUtilities"
	"Enterprise.Test.StandardNamePrefix" :  "Test"

# Formated Names
Combining application info along with standard name for names used in the build and deployment.
Example:

	"Application.FormattedAppName" : "$(Application.Settings.Type)-$(Application.Settings.BaseName)"
	"Application.Test.FormattedAppNameEnv": "$(Enterprise.Test.StandardNamePrefix)$(Application.FormattedAppName)"

# GateWay Info
Used to connect to Gateway for API's
Example:

	"Appplication.Test.ApiGateway.SwaggerUrl" : "https://$(Application.Test.FormattedAppNameEnv)$(Enterprise.StandardDomainNameSuffix)/swagger/v1/swagger.json"

# Enable Git command
Used for build script calls to pull from remote repositories

    "system.prefergit" : "true"

# Full Debug Logging
Used to output verbose logging
Example:
	
	"system.debug" : "true"



# Build Phase: - compile source code
- Acquire Build Scripts (custom scripts)
	- Powershell script that uses git clone command line to pull a repository that stores all other release utilities
	- Must expose the system.accesstoken into the powershell for authorization

```	 
	env:
	TOKEN: $(system.accesstoken)
```

- List out current environment variables and attach to the build
	- Powershell script to dump all environment variables to ease in troubleshooting
- Powershell script for start build script
	- Allows for centralized location to modify all build starts
- Acquire application specific secret files (only needed until Key Vault is utilized)
- Dotnet Restore - pulls the packages from nuget and/or private package management stores such as Artifactory
- Build Solution - runs dotnet build
- Run Unit Tests
  - Test.RunSettings file  
	    - used to exclude moq.dll from code coverage
	    - used to exclude attribute ExcludeFromCodeCoverage
	    - used to exclude Compiler Generated code
    
- Build Quality Checks - Fails the build if the code coverage is too low or drops
    allow coverage variance 3 percent
    upper threshold 80 by default

- ***Static Application Security Testing (SAST/ code analysis tools)
    sonarqube/sonarlint 

# Phase Artifacts
    - Publish symbols for VSTS - ease of debugging current version
    - Publish artifacts for VSTS - makes the build available for Release pipeline or to view all the deployable files
    - Compress Artifacts - saves on disk space
    - Upload Artifacts to Artifactory - long term storage, allows for retrieval of deployed system 

# Test Deployment Phase -
- Deployment start powershell
	Allows for metrics to be captured
- Secret Validation step
- Verify that the dev secrets and test secret KEYS are in synch
- stop App Service - prerelease slot
	- (unlock all files)
- stop Web jobs - prerelease slot
	- (app insights/workers caused issues with deployment steps)
- Deploy to app service - prerelease slot
- Deploy Secrets to Webapp ** until Key Vault is utilized
- start App Service - prerelease
- Deploy app insights extension (ensures latest version is installed)
- start web job - prerelease
- swap slots
	- This allows for Zero Down Time Deployments (ZDD)
- Add api to Gateway (if it is an api)
- Deploy DB package (if using database projects)
- Run Integration/Functional/Regression/Perf/Load Tests (anything that needs full system using gateway path if api)
- Stop pre-release slot -  
	- Several apps use Message queuing and may not be dynamically configured to halting topic processing?
- If Tests return failure revert Slots?
- central powershell script for end build script
	- Build Metric Info and Results

# Prod Deployment (Master branch only)
- Same as test environment 
- Testing packages may be different
	- Run Smoke Test

# Conditional run statements 
Examples:
-Only run if the previous step succeeded and the branch = master

	condition: and(succeeded(), eq(variables['Build.SourceBranch'], 'refs/heads/master'))
	
- Only run if the previous step succeeded and the application type is a service
- 
	condition: and(succeeded(), eq(variables['Application.Type'], 'SVC'))

# .vsts-ci.yml File Layout

	└───phases
	    ├───phase
	    │   ├───queue|deployment|server
	    │   ├───variables
	    │   └───steps
	    │       ├───step # e.g. script: echo hello world
	    │       └───[...]
	    │
	    └───[...]


# .Net Core Apps - Code Coverage
- Enable Code Coverage:
	1. Add package Microsoft.CodeCoverage (1.0.3) into your test project.
	2. Add the <DebugType>Full</DebugType> tag on the .csproj file on the projects we want to see code coverage values (inside <PropertyGroup> as explained on the vstest github link).
	3. Run unit tests.
	4. On the "Test Explorer" select passed unit tests, right click -> "Analyze Code Coverage for Selected Tests".
	5. You should see code coverage for your assemblies.
	6. If you are able to see code coverage for the test projects removed
		
			<DebugType>Full</DebugType> from the test projects

# Reference Links:
- [Yml Schema](https://github.com/Microsoft/vsts-agent/blob/master/docs/preview/yamlgettingstarted-schema.md)
- [Yml Overview](https://docs.microsoft.com/en-us/vsts/pipelines/build/yaml?view=vsts)
- [Getting Started Build Yaml](https://github.com/Microsoft/vsts-agent/blob/master/docs/preview/yamlgettingstarted.md) 
- [Key Vault - what?](https://docs.microsoft.com/en-us/azure/key-vault/key-vault-whatis)
- [Key Vault - Overview](https://azure.microsoft.com/en-us/services/key-vault/)
- [Key Vault in .net Core](https://docs.microsoft.com/en-us/aspnet/core/security/key-vault-configuration?view=aspnetcore-2.1&tabs=aspnetcore2x)
- [Database projects:](https://msdn.microsoft.com/en-us/library/xee70aty.aspx)
- [Test](https://docs.microsoft.com/en-us/vsts/pipelines/test/continuous-test-selenium?view=vsts)
	- 	Capture traffic using Fiddler and export as a Visual Studio Web Test file
	- 	Create a load test file in Visual Studio

