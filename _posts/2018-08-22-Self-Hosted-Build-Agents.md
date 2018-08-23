--- 
layout: post 
title: "Self-Hosted-Build-Agents are Bad" 
description: "" 
categories:  
author: "Chris Hudson" 
meta: "" 
--- 

# Self hosted build Agents for VSTS builds

Some of the reasons/Advantages to self hosting your build agent.

1. You want to speed up your builds 
    - cache nuget/npm packages on the server
2. You have specific frameworks, that you build (.Net Framework 3.5)
3. You have utilities you want persisted
  
Problems with this:

1. Requires a vm most likely Microsoft Windows Server  
2. Maintenance that means patch Tuesdays 
    - patches
    - scans 
    - responding to monitors/alerts
    - checking security center
3. Install and maintain antivirus/antimalware 
4. Disk encryption - slows things down as well
5. Clear nuget cache to remove stale and de-listed packages 
    - Should be done each build which negates alot of the time savaings
6. Clear workspaces 
    - clear all build directories starting with clean environment on each build.

Costs: $130/month + 15/Pipeline

- 80/month Standard DS12 (4 vcpus, 28 GB memory) + 1 TB disk
- 50/month 1 hour sysadmin work @ 50/hr - 
   
 - 15/month/pipeline


# Microsoft-Hosted

1. By default you are limited to 240 minutes of build/month 
    - if you pay for additional hosted agents this limitation goes away 
2. Running on hosted environment, it is slower
3. Fixed environments - latest RTM .Net frameworks, powershell environment 
4. if you want your own build utilities you need to package them and download them to the agent
    - Example you have your own powershell scripts to customize the build tasks and they are stored in a Git repository, you have to create a powershell task to download them separately

Costs: $40/month/Pipeline