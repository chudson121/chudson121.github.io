---
layout: post
title: ".net core app vs .netstandard"
description: "Overview and description of which project type should i use?"
categories: framework
author: "Chris Hudson"
meta: ".net core, .netcore, .netstandard, frameworks"
---

## .Net Core App vs .NetStandard
# TLDR;
- Libraries (including those nuget packages) should target .netstandard
- Applications should target .netcoreapp
- [dazinator commented on Jun 28, 2016](https://github.com/Shazwazza/Smidge/issues/36)  sums it up well "netcoreapp is used for applications / exe's that target net core framework. netstandard is used for libraries that run on net core framework."
 
In an api that i have written i have several projects
 
- services project (class library)
- repo project (class library)
- controllers project (class library)
- startup project (console App)

All but the startup project should target netstandard, since the startup project is a console app and is the entry point into the application, it should have the concrete implementation of coreapp  
you can verify this in the csproj files in the class libraries (if target 2.0 version)

	<TargetFramework>netstandard2.0</TargetFramework>

Whereas the startup proj references .net core 2.1 
	
	<TargetFramework>netcoreapp2.1</TargetFramework>

[Framework compatibility](https://docs.microsoft.com/en-us/dotnet/standard/frameworks)

[.net Framework 4.7.1](https://github.com/dotnet/standard/issues/514)  implements .netStandard2.0 "This means that you don't have to deploy any additional files or use binding redirects to use .NET Standard 2.0 libraries."

[Implementation Support](https://docs.microsoft.com/en-us/dotnet/standard/net-standard)

|----------------------------|---|---|---|---|---|---|---|---|
|.NET Standard|1.0|1.1|1.2|1.3|1.4|1.5|1.6|2.0|
|.NET Core|1.0|1.0|1.0|1.0|1.0|1.0|1.0|2.0|
|.NET Framework 1|4.5|4.5|4.5.1|4.6|4.6.1|4.6.1|4.6.1|4.6.1|
|Mono|4.6|4.6|4.6|4.6|4.6|4.6|4.6|5.4|
|Xamarin.iOS|10.0|10.0|10.0|10.0|10.0|10.0|10.0|10.14|
|Xamarin.Mac|3.0|3.0|3.0|3.0|3.0|3.0|3.0|3.8|
|Xamarin.Android|7.0|7.0|7.0|7.0|7.0|7.0|7.0|8.0|
|Universal Windows Platform|10.0|10.0|10.0|10.0|10.0|10.0.16299|10.0.16299|10.0.16299|
|Windows|8.0|8.0|8.1||||||
|Windows Phone|8.1|8.1|8.1||||||
|Windows Phone Silverlight|8.0|||||||


# References:


[straight from the Microsoft folks](https://github.com/dotnet/corefx/blob/master/Documentation/architecture/net-core-applications.md)

- Q: Why is there only one version of .NETCoreApp (1.0), but there are many of .NETStandard?
- A: .NETStandard is an abstract representation of API that covers all historical platforms that have ever supported that API. .NETCoreApp represents a concrete application type with a runnable implementation. We are shipping one version of this implementation at this point and it supports netstandard1.6. As we version .NETStandard in the future we will update the implementation of .NETCoreApp to support the new API and ship a new version of .NETCoreApp.

- Q: How is this different than .NETStandard?
- A: The NETStandard target framework is an abstract target framework that represents API surface of many frameworks and platforms. As such NETStandard assemblies can run on any platform that supports the NETStandard targeted by that assembly, for example: .NET Desktop, Windows Phone, Universal Windows Platform applications, .NET Core applications, etc. NETCoreApplication is a concrete target framework that represents a single platform with both API surface and implementation. .NET Core applications are runnable on their own. .NETStandard libraries must be published-for or consumed-by a specific concrete target framework to be used in that type of application.

- Q: How is this different than .NETFramework, AKA: Full .NET, Desktop .NET, Big .NET, old .NET?
- A: .NETFramework is another concrete framework like .NETCoreApp but has a different implementation and runtime and supports a different set of API. Both .NETFramework and .NETCoreApp support a common version of .NETStandard and the API it exposes. As such a .NETStandard assembly can be used by both .NETFramework and .NETCoreApp, but a .NETCoreApp assembly is not meant to run on .NETFramework, nor is a .NETFramework assembly meant to run on .NETCoreApp.

[SO](https://stackoverflow.com/questions/44085424/net-standard-vs-net-core/45722216)
- .Net Standard is a specification (ie Interface_
- .net core app is an implementation of the .net standard