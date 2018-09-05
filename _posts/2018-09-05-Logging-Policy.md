--- 
layout: post 
title: "Example Logging Policy" 
description: "Logging Policies for application development" 
categories:  
author: "Chris Hudson" 
meta: "" 
--- 

# Requirements
- All locally created log files should be contained to a centralized single folder 
- example: \Logs
- Errors should be logged to a separate log file allowing ease of troubleshooting
- Debug or higher can be logged to a combined log file in the standard log folder  
- Applications on the file system will only 10 log files of each type
- Log files must be less than 20mb in size - allows ease of use to download/view in browser
- Oldest log files should auto delete (roll off) - prevents log files from consuming storage
- Logs will be retained for 90 Days in log aggregations systems for production systems.
- Logs must be stored in secondary location out of the control of the application (Log aggregation system)

# Application Logging Purpose
- Business process monitoring e.g. sales process abandonment, transactions, connections.
- Audit trails e.g. data addition, modification and deletion, data exports.
- Identifying security incidents
- Monitoring policy violations
- Establishing baselines
- Providing information about problems and unusual conditions
- Contributing additional application-specific data for incident investigation which is lacking in other log sources
- Helping defend against vulnerability identification and exploitation through attack detection
- Performance monitoring e.g. data load time, page timeouts
- Compliance monitoring
- Data for subsequent requests for information e.g. data subject access, freedom of information, litigation, police and other regulatory investigations
- Legally sanctioned interception of data e.g application-layer wire-tapping
- Other business-specific requirements

# Logging Levels
- Debug - verbose diagnostic info
- Informational - typical business flow
- Warning - affects customer but doesn’t need action
- Error - breaking business flow requires immediate action


# Logging entries must contain
- Log date and time - UTC Timestamp
- Event date and time - the event time stamp may be different to the time of logging e.g. server logging where the client application is hosted on remote device that is only periodically or intermittently online
- Severity of event (debug, informational, warning, error) 
- Application identifier e.g. name and version (service/command/application name)
- Application address e.g. cluster/host name or server IPv4 or IPv6 address and port number, workstation/server/instance identity, local device identifier, webhost name 
- Environment (Test | Production)
- Interaction identifier - track event throughout business flow, across multiple api's
- Type of event
- Window/form/page e.g. entry point URL and HTTP method for a web application, dialogue box name
- Description/Message
- Code location e.g. script name, module name
- Source address e.g. user's device/machine identifier, user's IP address, Device used (terminal session ID, web browser, etc)
- User identity (if authenticated or otherwise known) e.g. user database table primary key value, CustomerID, api ID

# What to log
- Input validation failures e.g. protocol violations, unacceptable encodings, invalid parameter names and values
- Output validation failures e.g. database record set mismatch, invalid data encoding
- Authentication successes and failures
- Authorization (access control) failures
- Session management failures e.g. cookie session identification value modification
- Application errors and system events e.g. syntax and runtime errors, connectivity problems, performance issues, third party service error messages, file system errors, file upload virus detection, configuration changes
- Application and related systems start-ups and shut-downs, and logging initialization (starting, stopping or pausing)
- Use of higher-risk functionality e.g. network connections, addition or deletion of users, changes to privileges, assigning users to tokens, adding or deleting tokens, use of systems administrative privileges, access by application administrators, all actions by users with administrative privileges, access to payment cardholder data, use of data encrypting keys, key changes, creation and deletion of system-level objects, data import and export including screen-based reports, submission of user-generated content - especially file uploads
- Legal and other opt-ins e.g. permissions for mobile phone capabilities, terms of use, terms & conditions, personal data usage consent, permission to receive marketing communications

# Optionally 
consider if the following events can be logged and whether it is desirable information

- Sequencing failure
- Excessive use
- Data changes
- Fraud and other criminal activities
- Suspicious, unacceptable or unexpected behavior
- Modifications to configuration
- Application code file and/or memory changes
- Secondary time source (e.g. GPS) event date and time
- Action - original intended purpose of the request e.g. Log in, Refresh session ID, Log out, Update profile
- Object e.g. the affected component or other object (user account, data resource, file) e.g. URL, Session ID, User account, File
- Result status - whether the ACTION aimed at the OBJECT was successful e.g. Success, Fail, Defer
- Reason - why the status above occurred e.g. User not authenticated in database check ..., Incorrect credentials
- HTTP Status Code (web applications only) - the status code returned to the user (often 200 or 301)
- Request HTTP headers or HTTP User Agent (web applications only)
- User type classification e.g. public, authenticated user, CMS user, search engine, authorized penetration tester, up time monitor (see "Data to exclude" below)
- Analytical confidence in the event detection [Note B] e.g. low, medium, high or a numeric value
- Responses seen by the user and/or taken by the application e.g. status code, custom text messages, session termination, administrator alerts
- Extended details e.g. stack trace, system error messages, debug information, HTTP request body, HTTP response headers and body
- Internal classifications e.g. responsibility, compliance references
- External classifications e.g. NIST Security Content Automation Protocol (SCAP), Mitre Common Attack Pattern Enumeration and Classification (CAPEC)

# What NOT to Log

Never log data unless it is legally sanctioned. For example intercepting some communications, monitoring employees, and collecting some data without consent may all be illegal.
Never exclude any events from "known" users such as other internal systems, "trusted" third parties, search engine robots, uptime/process and other remote monitoring systems, pen testers, auditors. However, you may want to include a classification flag for each of these in the recorded data.
The following should not usually be recorded directly in the logs, but instead should be removed, masked, sanitized, hashed or encrypted

- Application source code
- Session identification values (consider replacing with a hashed value if needed to track session specific events)
- Access tokens
- Sensitive personal data and some forms of personally identifiable information (PII) e.g. health, government identifiers, vulnerable people
- Authentication passwords
- Database connection strings
- Encryption keys and other master secrets
- Bank account or payment card holder data
- Data of a higher security classification than the logging system is allowed to store
- Commercially-sensitive information
- Information it is illegal to collect in the relevant jurisdictions
- Information a user has opted out of collection, or not consented to e.g. use of do not track, or where consent to collect has expired

# Enterprise Logging Systems 

- [Exceptionless](https://exceptionless.com/) Real-time error, feature, and log reporting for your apps 
    - Send exceptions and errors - this is used for actionable items
    - Example: database is down, connectivity to endpoint doesn’t work, cache is unavailable, business failures

- [Seq](https://getseq.net/) log aggregation tool (good for small to mid sized usage)
    - Runs on VM, log server contains - structured logging adds context to errors and application events. 
    - Quickly zoom-in to find related events by filtering on properties, or use the same technique to exclude noise and see only what is relevant to a line of exploration.

- [DataDog](https://www.datadoghq.com/) Application Monitoring and Alerting Sass 

- [Pingdom](https://www.pingdom.com/) Up-time Monitoring Sass system

- [Splunk](https://www.splunk.com/) - full integrated system, Security information and event management system (SIEM)

- [Application Insights](https://docs.microsoft.com/en-us/azure/application-insights/app-insights-overview) is an extensible Application Performance Management (APM) service for web developers on multiple platforms. Use it to monitor your live web application. ... It works for apps on a wide variety of platforms including .NET, Node.js and J2EE, hosted on-premises or in the cloud.

# .Net Logging Frameworks

- [NLog vs log4net vs Serilog: Compare .NET Logging Frameworks](https://stackify.com/nlog-vs-log4net-vs-serilog/) Cool blog article comparing nlog, log4net and serilog
- [SeriLog](https://serilog.net/) - diagnostic logging library for .NET applications
    - Uses structured event data
    - extensible using Multiple Sinks 
- [Log4Net](https://logging.apache.org/log4net/)
    - old but still good
- [.Net Core 2.1](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/logging/?view=aspnetcore-2.1) 
    - .net Core 2.1 logger
    - good for basic level logging console, debug, file



# See also:
[Owasp Logging Cheat Sheet](https://www.owasp.org/index.php/Logging_Cheat_Sheet) 