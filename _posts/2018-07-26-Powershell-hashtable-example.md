--- 
layout: post 
title: "Powershell hashtable example" 
description: "powershell hash table" 
categories:  powershell example
author: "Chris Hudson" 
meta: "powershell hash" 
--- 

I was working with a colleague of mine and he wanted to use powershell and replace an ugly set of names with a more business friendly values. So the first thing i thought of was a list of key value pairs (ie lookup table). 

# PowerShell Hashtable Example
	$uglyArray ='ugly1', 'ugly2', 'ugly3'
	$LookUpHashTable = @{
		ugly3 ="Win7"
		ugly1="Vista"
		ugly2="XP"
	}
	
	# Looping through the array of ugly names output the translated value
	Foreach ($i in $uglyArray)
	{
	
	 Write-Host "uglyname = $i"
	 $output = $LookUpHashTable[$i]
	 Write-host "PrettyName = $output"
		
	}
	
	Write-Host "There are" $LookUpHashTable.count "keys"
	# example of directly accessing the value for a specified key
	$LookUpHashTable.ugly1
	

