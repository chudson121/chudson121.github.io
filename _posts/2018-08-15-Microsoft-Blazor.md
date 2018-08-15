--- 
layout: post 
title: "Microsoft Blazor" 
description: "What is it and how to deploy it" 
categories:  
author: "Chris Hudson" 
meta: "" 
--- 


# Blazor


Blazor is .Net single page application (SPA) - allowing to create Dynamic web pages using .Net and Webassembly (a compilation target that other languages can leverage). It is a web UI framework based on c#, razor and html that runs in the browser via [WebAssembly](https://webassembly.org/)

**Right now Blazor is unsupported experimental framework!** Microsoft will not support this. I hope this will change soon but please be mindful of this. 

It requires

- .net Core 2.1 or better 
- VS2017 15.7
- [ASP.NET Core Blazor Language Services extension](https://go.microsoft.com/fwlink/?linkid=870389)

# First Blazor App

    dotnet new -i Microsoft.AspNetCore.Blazor.Templates
    dotnet new blazor -o BlazorApp1
    cd BlazorApp1
    dotnet run

if everything works they way it is supposed to you should have a hello world app running locally.

I will use this app for the build process as well. 

# Infrastructure

## Storage Account
I Used Anthony Chu's blog at to start off with [Hosting a Blazor App in Azure Storage Static Websites](https://anthonychu.ca/post/blazor-azure-storage-static-websites/)

For the Blazor client - the SPA files we will use Azure's Blob Storage Static Websites hosting that is currently in preview. The ability to deliver web content without the need for server management, or even PaaS offerings is Awesome!

Since this is the first time playing with all this I did it using the azure portal to get the feel for things before we automate all the things!

For Detailed info on storage account creation [About Azure storage accounts](https://docs.microsoft.com/en-us/azure/storage/common/storage-create-storage-account)
in [Preview Azure Portal](https://preview.portal.azure.com) I went to Storage Account
         
    Create Storage Account
    Name = uniqueName
    Account Kind = StorageV2
    Locaiton = i choose East Us 2
    Replicaiton = left default of REad-access geo-redundant storage
    Performance = since this is test i used standard
    Access tier = Hot
    Secure transfer required = enabled
    Subscription = choose yours
    Resource Group = BlazorApp  I created a new one to hold all the blazor test resources
    Virtual networks = left disabled

![StorageAccount - Static Website Settings](https://i.imgur.com/ruDlXih.png)]

Once the storage was created, I went to the static website (preview) menu item (right above properties menu item).
and enabled the static website, when i did that it created a new container $web. I also modified the error document path to index.html per Anthony Chu's article on the routing issue. 
After that you need

- Access key 
- primary endpoint for the build.
- Resource group name (BlazorApp)

## Application Service
- App Services
- New Web App
  - click Create
  - App Name = test-svc-Blazor
  - subscription = your sub
  - Resource Group = BlazorApp
  - OS I choose windows
  - new app service plan
      - App service plan name = blazorapp
      - location - i choose east us 2
      - pricing - s1 (to get the deployment slots) or free one - choose a F1
  - Application insights = on
      - App insights locaiton East us
   -click create

Once Created go to app service of the newly created web app
click on slot 
Add Slot
name = pre-release

App Settings
Turn off php version
Platform = 64bit
http version= 2.0
arr affinity = off
click save

## Build
VSTS - Gui version
Create Build (blank template)
I used hosted VS2017 Agent

## Deploy Client to Blob Storage  
I do a dotnet publish on the blazor client and deploy that to the blob store.

- Add .Net Core task
    - command = publish
    - Publish web projects = checked
    - Arguments = -c Release -o out
    - Zip Published projects = not checked
    - Add project name to publish path = not checked

- Add AzureBlob File Copy (preview) task
    - source = **D:\a\1\s\BlazorPilot.Client\out\web.config**
    - Azure Connection Type = Azure Resource Manager
    - Subscription = choose your subscription
    - Destination Type = Azure Blob
    - RM Storage Account= Resource group name of the blob storage 
    - Container Name = $web
    - Blob previx = empty
    - optional arguments = empty
    - storage container URI = the primary endpoint from the storage account state web site settings
    - Storage Container SAS Token = primary access key from the storage account

- Add another AzureBlob File Copy (preview) task
    - source = **D:\a\1\s\BlazorPilot.Client\out\BlazorPilot.Client\dist**
    - Azure Connection Type = Azure Resource Manager
    - Subscription = choose your subscription
    - Destination Type = Azure Blob
    - RM Storage Account= Resource group name of the blob storage 
    - Container Name = $web
    - Blob previx = empty
    - optional arguments = empty
    - storage container URI = the primary endpoint from the storage account state web site settings
    - Storage Container SAS Token = primary access key from the storage account

## Blazor client and Service Build and Deploy to app service  
- .Net Core Task
    - command = restore
    - Path to projects = **\*.csproj
- Visual Studio Build Solution
    - msbuild args
            
            /p:DeployOnBuild=true /p:WebPublishMethod=Package /p:PackageAsSingleFile=true /p:SkipInvalidConfigurations=true /p:PackageLocation=$(build.artifactstagingdirectory) /m
    - Configuration = release
- Test Assemblies - **ARGHHHHH** the template doesn't come with a test project :(
- Check Build Quality - well this step isn't needed since there are no tests
- Index sources & Publish Symbols path - used for debugging

I Cloned the Azure App Service Manage Task task several times and just tweaked the action as needed. I have found that if you stop the app and the webjobs that the deployments are more successful. App insights has been setup as a webjob when you install the extension and sometimes it doesn't like to release resources and that causes deployment failures

- Azure App Service Manage Task
    - Action = stop app service
    - App Service name = test-svc-Blazor
    - specify slot or App Service Environment = checked
    - Resource Group = BlazorApp
    - Slot = pre-release

- Azure App Service Manage Task
    - Action =  stop all continuous webjobs
    - App Service name = test-svc-Blazor
    - specify slot or App Service Environment = checked
    - Resource Group = BlazorApp
    - Slot = pre-release

- Azure App Service Deploy Task
    - Subscription = choose yours 
    - App Type = web app
    - App Service Name = test-svc-Blazor
    - Deploy to slot = checked
    - Resource Group = BlazorApp
    - Virtual application = left blank
    - pakcage or folder = D:\a\1\a\BlazorPilot.Server.zip 
    - Application and Configuraiton Settings
        - App Settings

                -ASPNETCORE_ENVIRONMENT Test -Build $(Build.BuildNumber)

- Azure App Service Manage Task
    - Action = Install extensions
    - App Service name = test-svc-Blazor
    - specify slot or App Service Environment = checked
    - Resource Group = BlazorApp
    - Slot = pre-release
    - Install Extensions = Application Insights extension for Azure App Service


- Azure App Service Manage Task
    - Action = start app service
    - App Service name = test-svc-Blazor
    - specify slot or App Service Environment = checked
    - Resource Group = BlazorApp
    - Slot = pre-release


- Azure App Service Manage Task
    - Action =  start all continuous webjobs
    - App Service name = test-svc-Blazor
    - specify slot or App Service Environment = checked
    - Resource Group = BlazorApp
    - Slot = pre-release

- Azure App Service Manage Task
    - Action =  Swap Slots
    - App Service name = test-svc-Blazor
    - specify slot or App Service Environment = checked
    - Resource Group = BlazorApp
    - Source Slot = pre-release
        - swap with produciton = checked



## Learn More
- [Blazor - Steven Sanderson NDC talk](https://www.youtube.com/watch?v=JU-6pAxqAa4)
- [GitHub aspnet/Blazor](https://github.com/aspnet/Blazor)
- [Death to JavaScript! Blazor, for .NET Web Apps Using WebAssembly, Goes Alpha
By David Ramel](https://visualstudiomagazine.com/articles/2018/03/23/blazor-alpha.aspx)
[WebAssembly](https://developer.mozilla.org/en-US/docs/WebAssembly)

- [What is Blazor](https://learn-blazor.com/getting-started/what-is-blazor/)

- [A new experiment: Browser-based web apps with .NET and Blazor
](https://blogs.msdn.microsoft.com/webdev/2018/02/06/blazor-experimental-project/)

- [Static website hosting in Azure Storage (Preview)](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-static-website)