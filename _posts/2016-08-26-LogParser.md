---
layout: post
title: iis log parser
tags: logparser
---
# [IIS Log Parser 2.2](https://www.microsoft.com/en-us/download/details.aspx?id=24659)

[Log Parser Studio](http://gallery.technet.microsoft.com/Log-Parser-Studio-cd458765)

	@Echo Off
	REM Usage: logparser "sql" -rtp:-1
	REM Notes
	:: still working exit page
	
	REM exit page
	REM Summary
	
	REM Test config
	@Set OutputType=-rtp:-1
	@Set LogPath=C:\Users\chudson\Desktop\Logparser\April\ex090412.log
	
	
	REM Prod Config
	@Set OutputType=-o:csv -stats:OFF -i:IISW3C
	@Set LogPath=C:\Users\chudson\Desktop\Logparser\April\ex0904*.log
	@Set HomeURL='%%hpainsurance.com%%'
	
	Echo Started %date%,%time%
	Call :DOPARSE
	
	:End
	Goto:EOF
	
	:GETDATE
		Rem set variables
		REM Get todays date.
		:: This will return date into environment vars
		:: Works on any NT/2K/XP machine independent of regional date settings
		:: 20 March 2002
	
		   FOR /f "tokens=1-4 delims=/-. " %%G IN ('date /t') DO (call :s_fixdate %%G %%H %%I %%J)
		   goto :s_print_the_date
	   
		   :s_fixdate
		   if "%1:~0,1%" GTR "9" shift
		   FOR /f "skip=1 tokens=2-4 delims=(-)" %%G IN ('echo.^|date') DO (
		       set %%G=%1&set %%H=%2&set %%I=%3)
		   goto :eof
	
		   :s_print_the_date
		   echo Month:[%mm%]  Day:[%dd%]  Year:[%yy%]
		   echo copying file to ND\%mm%-%dd%-%yy%
	REM End GETDATE
	GOTO:EOF
	
	
	
	:DOPARSE
	REM logparser -o:csv Select * into over_1_second.csv From ....
	REM --Time on site
	REM set sql="SELECT date, Min(time) as FirstHit, Max(time) as LastHit,  c-ip as UserIP FROM %LogPath% WHERE sc-status=200 AND EXTRACT_EXTENSION(to_lowercase(cs-uri-stem)) = 'aspx' GROUP BY UserIP, date ORDER BY date"
	REM set sql="SELECT date, cs-uri-stem, c-ip as UserIP FROM 	%LogPath% WHERE sc-status=200 AND EXTRACT_EXTENSION(to_lowercase(cs-uri-stem)) = 'aspx' GROUP BY date, UserIP, cs-uri-stem ORDER BY date, UserIP" 
	
	
	REM ***********************************
	Echo Summary Keywords by provider
	REM ***********************************
	set sql="Select EXTRACT_TOKEN(cs(Referer),2, '/') as RefererHostName , Case TO_STRING(INDEX_OF(cs(Referer), 'yahoo')) When null THEN TO_UPPERCASE(REPLACE_STR(EXTRACT_VALUE(cs(Referer),'q'),'+', ' ')) Else TO_UPPERCASE(REPLACE_STR(EXTRACT_VALUE(cs(Referer),'p'),'+', ' ')) End as Keywords, Count(*) as Hits Into Sum_KeyWords.csv FROM %LogPath% Where cs(Referer) IS Not Null AND cs(Referer) not like %HomeURL% And cs-uri-stem not like '%%.jpg' And cs-uri-stem not like '%%.gif' AND (cs(Referer) like '%%google.com/search?%%' OR cs(Referer) like '%%yahoo.com/search?%%' OR cs(Referer) like '%%results.aspx?%%') AND (EXTRACT_VALUE(cs(Referer),'q') is not null OR EXTRACT_VALUE(cs(Referer),'p') is not null) Group By RefererHostName, Keywords Order By Hits desc"
	logparser %sql% %OutputType%
	
	
	REM ***********************************
	Echo Summary unique referrers
	REM ***********************************
	set sql="Select EXTRACT_TOKEN(cs(Referer),2, '/') as RefererHostName, cs(Referer) AS RefererURL, count(cs(Referer)) AS Hits INTO Sum_UniqueReferrers.csv FROM %LogPath% Where cs(Referer) IS Not Null AND cs(Referer) not like %HomeURL% And cs-uri-stem not like '%%.jpg' And cs-uri-stem not like '%%.gif' GROUP BY cs(Referer) ORDER BY Hits DESC"
	
	REM OLD SELECT cs(Referer), Count(cs(Referer)) AS Hits %OutputFile% FROM %LogPath% Where cs(Referer) IS Not Null AND cs(Referer) not like %HomeURL% And cs-uri-stem not like '%%.jpg' And cs-uri-stem not like '%%.gif' GROUP BY cs(Referer) ORDER BY Hits DESC"
	logparser %sql% %OutputType%
	
	REM ***********************************
	Echo Summary Errors ordered by Url and Status:
	REM ***********************************
	set sql="SELECT cs-uri-stem AS Url, sc-status AS Status, COUNT(*) AS Errors INTO Sum_Errors.csv FROM  %LogPath% WHERE (sc-status >= 400) GROUP BY Url, Status ORDER BY Errors DESC"
	logparser %sql% %OutputType%
	
	
	REM ***********************************
	Echo Summary Hourly Hits
	REM ***********************************
	set sql="SELECT TO_STRING(time, 'HH') AS Hour, COUNT(*) AS Hits INTO Sum_HourlyHits.csv FROM %LogPath% GROUP BY Hour ORDER BY Hour ASC"
	logparser %sql% %OutputType%
	
	
	REM ***********************************
	Echo Summary Avg Time per Page
	REM ***********************************
	set sql="SELECT cs-uri-stem, AVG(time-taken) As AvgTime INTO Sum_AvgTimePerPage.csv FROM %LogPath% GROUP BY cs-uri-stem Order by AvgTime DESC"
	logparser %sql% %OutputType%
	
	REM ***********************************
	Echo Summary More than 25 HTTP errors per hour:
	REM ***********************************
	set sql="SELECT date, QUANTIZE(time, 3600) AS Hour, sc-status AS Status, COUNT(*) AS Errors INTO Sum_LargeAmtErrorsPerHour.csv FROM  %LogPath% WHERE (sc-status >= 400) GROUP BY date, hour, sc-status HAVING (Errors > 25) ORDER BY Errors DESC"
	logparser %sql% %OutputType%
	
	
	
	REM ***********************************
	Echo Top 50 Items Retrieved
	REM ***********************************
	set sql="SELECT TOP 50 cs-uri-stem as Url, COUNT(cs-uri-stem) AS Hits INTO Top50Files.csv FROM %LogPath% GROUP BY cs-uri-stem ORDER BY Hits DESC"
	logparser %sql% %OutputType%
	
	
	REM ***********************************
	Echo Summary Hits per Day
	REM ***********************************
	set sql="SELECT TO_STRING(TO_TIMESTAMP(date, time), 'yyyy-MM-dd') AS Day, cs-uri-stem, COUNT(*) AS Total INTO Sum_HitsPerDay.csv FROM %LogPath% GROUP BY Day, cs-uri-stem ORDER BY cs-uri-stem, Day"
	logparser %sql% %OutputType%
	
	
	REM ***********************************
	Echo Summary Win32 error codes by total and page:
	REM ***********************************
	set sql="SELECT cs-uri-stem AS Url, WIN32_ERROR_DESCRIPTION(sc-win32-status) AS Error, Count(*) AS Total INTO SUM_Win32ErrorCodes.csv FROM  %LogPath% WHERE (sc-win32-status > 0) GROUP BY Url, Error ORDER BY Total DESC"
	logparser %sql% %OutputType%
	
	
	REM ***********************************
	Echo Summary HTTP methods (GET, POST, etc) used per Url:
	REM ***********************************
	set sql="SELECT cs-uri-stem AS Url, cs-method AS Method, Count(*) AS Total INTO Sum_HTTPMethods.csv FROM  %LogPath% WHERE (sc-status < 400 or sc-status >= 500) GROUP BY Url, Method ORDER BY Url, Method"
	logparser %sql% %OutputType%
	
	
	REM ***********************************
	Echo Summary Bytes sent from the server:
	REM ***********************************
	set sql="SELECT cs-uri-stem AS Url, Count(*) AS Hits, AVG(sc-bytes) AS Avg, Max(sc-bytes) AS Max, Min(sc-bytes) AS Min, Sum(sc-bytes) AS TotalBytes INTO Sum_BytesSentFromServer.csv FROM  %LogPath% GROUP BY cs-uri-stem HAVING (Hits > 100) ORDER BY [Avg] DESC"
	logparser %sql% %OutputType%
	
	REM ***********************************
	Echo Summary Bytes sent from the client:
	REM ***********************************
	set sql="SELECT cs-uri-stem AS Url, Count(*) AS Hits, AVG(cs-bytes) AS Avg, Max(cs-bytes) AS Max, Min(cs-bytes) AS Min, Sum(cs-bytes) AS TotalBytes INTO Sum_BytesSentFromClient.csv FROM  %LogPath% GROUP BY Url HAVING (Hits > 100) ORDER BY [Avg] DESC"
	logparser %sql% %OutputType%
	
	REM ***********************************
	Echo Summary Browser types
	REM ***********************************
	set sql="SELECT cs(user-agent), count(*) as Devices %OutputFile% into Sum_Browsers.csv FROM %LogPath% GROUP BY cs(User-Agent) ORDER BY cs(user-agent),Devices desc"
	logparser %sql% %OutputType%
	
	REM ***********************************
	Echo Summary Unique Hits by day filtered no imgs etc
	REM ***********************************
	set sql="SELECT Date, COUNT (*) AS PAGEVIEWS INTO Sum_UniqueHitsByDayFiltered.csv FROM %LogPath% WHERE EXTRACT_EXTENSION(to_lowercase(cs-uri-stem)) NOT IN ('asf';'axd';'css';'exe';'gif';'ico';'jpg';'js';'msi';'png';'txt';'vsi';'wmv';'xml';'zip') AND EXTRACT_PATH(to_lowercase(cs-uri-stem)) not like '%%hpainsurance%%' AND EXTRACT_PATH(to_lowercase(cs-uri-stem)) not like '%%/images%%' and sc-status=200 Group By Date"
	logparser %sql% %OutputType%
	
	REM ***********************************
	Echo Top 50 slowest items
	REM ***********************************
	set sql="SELECT TOP 50 cs-uri-stem AS Url, MIN(time-taken) as [Min], AVG(time-taken) AS [Avg], max(time-taken) AS [Max], count(time-taken) AS Hits INTO Top50Slowest.csv FROM %LogPath% WHERE time-taken < 120000 GROUP BY Url ORDER BY [Avg] DESC"
	logparser %sql% %OutputType%
	
	REM ***********************************
	Echo Top 50 Entry Pages
	REM ***********************************
	set sql="SELECT Top 50 STRCAT(EXTRACT_PATH(TO_LOWERCASE(cs-uri-stem)),'/') AS RequestedPath, EXTRACT_FILENAME(TO_LOWERCASE(cs-uri-stem)) AS EntryPoint, AVG(time-taken) AS AvgTime, COUNT(*) AS Hits INTO Sum_EntryPages.csv FROM %LogPath% WHERE (cs(Referer) IS NULL) AND (sc-status BETWEEN 200 AND 307) GROUP BY cs-uri-stem, cs(Referer) ORDER BY Hits DESC" 
	logparser %sql% %OutputType%
	
	
	
	
	REM Security Checks
	REM ***********************************
	Echo Security Get successfully loaded files:
	REM ***********************************
	set sql="SELECT DISTINCT TO_LOWERCASE(cs-uri-stem) AS URL, Count(*) AS Hits INTO Sec_FilesLoadedToServer.csv FROM %LogPath% WHERE sc-status=200 And cs-uri-stem not like '%.aspx' And cs-uri-stem not like '%.pdf' GROUP BY URL ORDER BY URL"
	logparser %sql% %OutputType%
	
	REM ***********************************
	Echo Security more than 25 error codes returned by date by hour
	REM ***********************************
	set sql="SELECT date, QUANTIZE(time, 3600) AS hour, sc-status, Count(*) AS Errors  INTO Sec_25ErrorsInHour.csv FROM %LogPath% WHERE sc-status>=400 GROUP BY date, hour, sc-status HAVING Errors>25 ORDER BY Errors DESC"
	logparser %sql% %OutputType%
	
	
	REM ***********************************
	Echo Security 50 times per day by a single ipaddress
	REM ***********************************
	set sql="SELECT DISTINCT date, cs-uri-stem, c-ip, Count(*) AS Hits  INTO Sec_50HitFromSameIP.csv FROM %LogPath% GROUP BY date, c-ip, cs-uri-stem HAVING Hits>50 ORDER BY Hits Desc"
	logparser %sql% %OutputType%
	
	
	REM HPA Specific
	REM ***********************************
	Echo HPA Distinct QT Sessions
	REM ***********************************
	set sql="SELECT Count(Distinct EXTRACT_TOKEN(cs(Referer), 3, '/')) as Session INTO HPA_DistinctQTSessions.csv FROM %LogPath% WHERE sc-status=200 AND cs-uri-stem like '%%/qt%%' AND cs(Referer) like 'https://www.hpainsurance.com/(S%%' "
	logparser %sql% %OutputType%
	
	
	
	Echo Endded %date%,%time%
	
	
	REM End DOPARSE
	GOTO:EOF
