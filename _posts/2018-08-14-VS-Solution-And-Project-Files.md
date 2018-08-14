--- 
layout: post 
title: "Development 101 - Solution And Project Files" 
description: "Development 101 - Solution and Project files in visual studio" 
categories:  Development 101
author: "Chris Hudson" 
meta: "Development 101" 
--- 

# Overview
The solution file and associated project files are used in the build system (MsBuild) to turn the source code into Dynamic Link Libraries (DLL'S) or executable files. 

## Solution File (.Sln)
A solution file is a text file containing information and acts as the top level container to maintain projects, solution folders, and project configurations. It may hold a website that depends on a class library and the test project.

## Project files (.csproj | .vbproj| .dbproj)
Project files are xml files that includes dependent packages, other project references, framework information, and compilation instructions for the files to include.

Project element is the top level and specifies entry points for the build process. 
Example of a .net core web site project root

    <Project Sdk="Microsoft.NET.Sdk.Web">

The PropertyGroup elements contain information for the build to use such as to the framework to use, cpu platform, debug/release mode configurations, and the entry point into the application,  

     <PropertyGroup>
        <TargetFramework>netcoreapp2.1</TargetFramework>
        <!-- this is needed for code coverage, add to all but testing projects -->
        <DebugType>Full</DebugType>
        <StartupObject>Api.Monitoring.Startup.Program</StartupObject>
    </PropertyGroup>

    <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Debug|AnyCPU'">
        <OutputPath>bin\Debug\</OutputPath>
        <DocumentationFile>bin\Debug\DO.Api.Monitoring.Startup.xml</DocumentationFile>
    </PropertyGroup>

The ItemGroup element has several uses
Directories to exclude
    
    <ItemGroup>
      <Compile Remove="bin\**" />
      <Compile Remove="Logs\**" />
      <Content Remove="bin\**" />
      <Content Remove="Logs\**" />
      <EmbeddedResource Remove="bin\**" />
      <EmbeddedResource Remove="Logs\**" />
      <None Remove="bin\**" />
      <None Remove="Logs\**" />
    </ItemGroup>

Packages to include

    <ItemGroup>
        <PackageReference Include="Microsoft.ApplicationInsights" Version="2.6.4" />



![Project Layout](https://docs.microsoft.com/en-us/aspnet/web-forms/overview/deployment/web-deployment-in-the-enterprise/understanding-the-project-file/_static/image2.png)

# Further Readings
- [Microsoft's Description of a solution file](https://msdn.microsoft.com/en-us/library/bb165951.aspx)
- [Understanding the project file by Jason Lee](https://docs.microsoft.com/en-us/aspnet/web-forms/overview/deployment/web-deployment-in-the-enterprise/understanding-the-project-file)
- [Learn about projects and solutions](https://docs.microsoft.com/en-us/visualstudio/ide/quickstart-projects-solutions)
- [Create solutions and projects](https://docs.microsoft.com/en-us/visualstudio/ide/creating-solutions-and-projects)