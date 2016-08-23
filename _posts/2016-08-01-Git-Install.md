---
layout: post
title: Git Installation
tags: git
---
# GIT
##	Installation:
For Windows Users you can Drop to an elevated command prompt and run these commands

- Install choco 
`@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin`
- Install GIT from Choco `choco install git --confirm`

## Example on cloning a GIT repo in Visual Studio
[TFS url: https://tfsserver/tfs/DefaultCollection/_code](https://tfsserver/tfs/DefaultCollection/_code "tfs")

- click the clone button on the right hand side  
- click the clone in Visual studio button  
then in VS you click the clone button (verify the path you want the source code to download to)  
- then you should see the solution file in the home part of team explorer inside VS  
- In Visual studio select path to clone to an click the clone button  
- Open solution file  
- Make changes  
- In team explorer click changes  
- Commit All and push – will push the changes to the server branch

Comments Format:  
`#<userstoryNumber- my comment here to associate changeset with the user story. `
 
# TFS Certificates 
## For Mac's:
- To resolve the SSL certificate issue on the Mac, Use Safari open https://tfsserver/tfs.  
- At that point I got an SSL error saying it could not verify the server.  
- From that dialog, I clicked on “Show Certificates” and then chose “always trust” on the TFS certification.   
- That then installs the cert in the keychain and I was able to clone the repo with git with no problems.  

## For Windows:
- Export TFS Cert  
in Chrome double click on the ssl padlock after navigating to https://tfsserver/tfs  
- click the details link (near the top)  
- click view certificate button  
- click details tab  
- click copy to file  
- this kicks off the welcome to cert export wizard  
- click next  
- select DER encoded binary x.509   
- give it a file name (such as tfs2015) I prefer to put it on the desktop  
- click next 
- click finish  
- click ok  

Import SSL Cert  
- right click on the certificat file and   
- choose install cert  
- Select Local Machine  
- click next  
- leave automatically select the cert store   
- click next  
- click finish  
- click ok  
	
After installing GIT:  
- Modify C:\Program Files\Git\mingw64\ssl\certs\ca-bundle.crt (windows)  
- Add root ssl cert at end of file  
	
## Configure Nuget
- Visual Studio
- tools --> options
- nuget package manager
- package sources
- click the + button add 
`https://ArtifacotryURL OR NuGet Server URL/`
