---
layout: post
title: Deployment Time transforms
tags: transforms
---

#3 steps
- Create/have a Config file with entries (web.config)
- Parameters.xml file --> what to replace and where to replace it
- Setparameters.xml --> take the mappings in parameters and replace those values with what's specified


#Parameters.xml 
mapping of web.config (or any file) and variable name for tokens; uses xpath to match. You can map the tokens, no failures will occur if they are not used.

	  <parameter name="appSettings.Environment" description="Please enter the name of the Environment" defaultvalue="__EnvironmentName__" tags="">
	    <parameterentry kind="XmlFile" scope="\\Web\.config$" match="/configuration/appSettings/add[@key='Environment']/@value">
	    </parameterentry>
	  </parameter>
	
#SetParameters.xml 
Replacement values for the tokens

	<setParameter name="appSettings.Environment" value="Production" />

***NO SENSITIVE INFORMATION GOES INTO THESE FILES*** 
Those are controlled with global overrides contact devops/RE (API Keys, passwords, etc)

	Application Code\
		Web.config
		parameters.xml (mapping of the sensitive info is GOOD)
		\Deployment\TEST.SetParameters.xml (No Sensitive data)
		\Deployment\PROD.SetParameters.xml (No Sensitive data)
	
#Global overrides (stored in secure location accessible by Jenkins)

- App Settings
	Environment, version, customErrors, compilationDebug, ErrorEmailTo

- Connection strings:
	Named

- SMTP server

- Endpoints:

- Application specific secret info
	API Keys, passwords, etc

During Build [application Code]\parameters.xml is combined with global_Parameters.xml file and that is packaged in the msdeploy zip file

	CALL "%JENKINS_HOME%\userContent\CompileNet\ConfigTransforms.bat" %PARAMETERSPATH%

#Deployment time (Package Job)

- These 2 variables are overridden via command line 

		-setParam:name="IIS Web Application Name",value="%WEBAPPNAME%" -setParam:name="appSettings.Version",value="%Version%.%PromotedBuildNumber%" 

- And we specify the environment specific setParamfile

		-setParamFile:"%JENKINS_HOME%\userContent\Transforms\%Environment%_SetParameters.xml"
