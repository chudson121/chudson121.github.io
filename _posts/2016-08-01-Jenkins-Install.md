# Jenkins Files and Configurations Information
* [**Jenkins Site**](https://jenkins)

##Troubleshooting
Restart Jenkins from command line (make sure run as admin)
net stop jenkins
net start jenkins


## Requirments
Server
SSL Cert
DNS Entry
Domain Service Account

Data Flow:
	Jenkins <--> IWSQL1.itworks.local
	Jenkins <--> sandbox 4,3,2,1 and production
	Jenkins <--> FTP sites for deployments 
	Jenkins <--> TFS 2015 server (don’t have the serve info yet)
	Jenkins <--> iwg-nugetserver.azurewebsites.net

## Windows Install
Run all the install commands to get all the pieces together
Service Account info - we ran with a domain account 
Modify Service to run under Domain Account
Add service account permissions to jenkins folder (full control)

Environment Settings 
System Properties. Control Panel, System, Advanced System Settings, Then Advanced tab, Environment Variables, Under System variables find Path
Or just run setx PATH=%PATH%;C:\Program Files (x86)\MSBuild\14.0\Bin

Make sure there isnt any info in the ldap email lookup - caused my user account to get locked as the binddn defaulted to my domain account and without a pw it locked it out.

Matrix Based Security - NOTE: Anonymous needs overall READ even if you have AD configured

## Applications
Install latest .net framework (offline installer)
[4.6](https://www.microsoft.com/en-us/download/details.aspx?id=48137)

Visual Studio Web Application build targets installed on your build server. This can be achieved either by installing REM an express version of Visual Studio or the Visual Studio Shell Redistributable Package.

`nuget install WebConfigTransformRunner.`

REM Install choco
`@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin`

`choco install git --confirm`

Install nuget.exe
`choco install nuget.commandline --confirm`

Get latest powershell
`choco install powershell`

Install windows sdk
`choco install windows-sdk-8.1 --confirm`
Path update
`setx SDKToolsPath "C:\Program Files (x86)\Microsoft SDKs\Windows\v8.1A\bin\"`

Install build tools
`choco install microsoft-build-tools --confirm`
Path update
`setx PATH %PATH%;"C:\Program Files (x86)\MSBuild\14.0\Bin"`

Install test agents
'choco install visualstudio2015testagents --confirm'

install Web Deploy
'choco install webdeploy --confirm'
[link](https://www.microsoft.com/en-us/download/confirmation.aspx?id=43717&6B49FDFB-8E5B-4B07-BC31-15695C5A2143=1)

Path update
`setx PATH %PATH%;"C:\Program Files\IIS\Microsoft Web Deploy V3"`

Microsoft.WebApplication.targets
copy from dev machine to build server
C:\\Program Files (x86)\\MSBuild\\Microsoft\\VisualStudio\\v14.0\\WebApplications

Install fxcop
`choco install fxcop --confirm`
`nuget Install Microsoft.CodeAnalysis.FxCopAnalyzers`

Path update
`setx FXCOPDIR "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Team Tools\Static Analysis Tools\FxCop\"`

Java dev kit
`choco install jdk8 --confirm`

Git
`choco install git --confirm`

Install Jenkins
`choco install jenkins --confirm`

Notepad++
`Choco install notepadplusplus --confirm`

Visual Studio
`choco install visualstudio2015professional`

VS Code Metrics Powertool for visual studio 2015
[link](https://www.microsoft.com/en-us/download/details.aspx?id=48213)

Install Target files
cd C:\\Program Files (x86)\\MSBuild\\14.0\\Bin
`nuget Install MSBuild.Microsoft.VisualStudio.Web.targets`

Copy from dev to CI Server
Msbuild would compile but msdeploy package would not be created
`C:\Program Files (x86)\MSBuild`

azure powershell
`choco install azurepowershell`

SonarQube allows code analysis
`choco install msbuild-sonarqube-runner`

python `choco install python2-x86_32`

curl `choco install curl`
	- `curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://hostname/resourc`

wget `choco install wget`
`wget https://KEMPLB/access/enablers?rs=10.1.1.31 --no-check-certificate -S -O - --header "Accept: application/json" --http-user=@@@@@@@@@ --http-password=@@@@@@@@@@`
 
install data dog
`msiexec /qn /i ddagent-cli.msi APIKEY="YOURAPIKEY" HOSTNAME="my_hostname" TAGS="mytag1,mytag2"`
[link](https://app.datadoghq.com/account/settings#agent/windows)

nuget package WebConfigTransformRunner
`Install-Package WebConfigTransformRunner`

Azure PowerShell
Install the Azure Resource Manager modules from the PowerShell Gallery
`Install-Module AzureRM`
Install the Azure Service Management module from the PowerShell Gallery
`Install-Module Azure`
