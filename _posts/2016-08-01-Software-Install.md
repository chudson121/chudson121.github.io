---
layout: post
title: My Software to install on new systems
tags: Splunk
---
# Software installs

## Chocolatey

	REM @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

	REM choco install androidstudio  -y
	REM choco install nmap  -y
	REM choco install notepadplusplus -y
	rem choco install resharper  -y
	REM choco install visualstudio2015enterprise  -y

	choco install 7zip -y
	choco install adobereader -y
	choco install beyondcompare -y
	choco install fiddler -y
	choco install git -y
	choco install google-chrome-x64 -y
	choco install googledrive -y
	choco install lastpass -y
	choco install malwarebytes -y
	choco install markdownpad2 -y
	choco install mssqlserver2014express -y
	REM http://markdownpad.com/download/awesomium_v1.6.6_sdk_win.exe
	choco install nuget.commandline -y
	choco install powershell -y
	choco install putty -y
	choco install python -y
	choco install rdcman -y
	choco install rdm -y
	choco install resharper -y
	choco install rsat -y
	choco install sysinternals -y
	choco install tfssidekicks2015 -y
	choco install visualstudio2015professional -y
	choco install webdeploy -y
	choco install windowsazurepowershell -y
	choco install winscp -y

## Visual Studio Extensions

	Locate in tfs
	Node.js Tools
	Nuget package manaer for vs 2015
	Powershell tools for vs 2015
	Team foundation server power tools 2015
	Tfs process template editor
	Tfs productivity pack
	Tfs source control explorer extension
	Git Source Control Provider

## Nuget

	install mvc 3
	install team foundation client Install-Package Microsoft.TeamFoundationServer.Client -Version 14.95.3
	Install-Package microsoft-web-helpers
