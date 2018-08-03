--- 
layout: post 
title: "Log Management Systems" 
description: "" 
categories:  
author: "Chris Hudson" 
meta: "" 
--- 

I had a conversation today around the different log management systems that I am familiar with so figured i would write it up here and share. All dollar amounts are in USD.

## Overview

# log management systems 
straight from [Wikipedia](https://en.wikipedia.org/wiki/Log_management)

Log management (LM) comprises an approach to dealing with large volumes of computer-generated log messages (also known as audit records, audit trails, event-logs, etc.). Log Management generally covers:[1]
    
- Log collection
- Centralized log aggregation
- Long-term log storage and retention
- Log rotation
- Log analysis (in real-time and in bulk after storage)
- Log search and reporting.


# The Big
For several large firms I used [splunk](https://www.splunk.com/)
This was an expensive option and at least a few years ago had some scaling issues with the implementations that was provided [Splunk Component diagram](http://docs.splunk.com/images/thumb/e/e0/Horizontal_scaling_new2_60.png/500px-Horizontal_scaling_new2_60.png). 

[ELK stack](https://www.elastic.co/elk-stack)
They provide both a cloud option or on premise option. I haven't used this product but know it is a pretty big contender, with most open source apps there are some downsides especially if they are not a SaaS offering. Here a competitor to ELK is SolarWinds analysis:

[SolarWinds ](https://www.loggly.com/blog/elkonomics-real-costs-of-elastic-stack/)
"Elastic Stack (aka ELK Stack) appears on many companies’ log management short lists. But our ELK log management total cost of ownership (TCO) analysis shows that a business with average daily log volumes growing from 100 GB to 800 GB over a four-year period will likely spend close to $4.2 million to operate and maintain a production-grade Elastic Stack"

# The Small
For a small start-up I installed and configured [SEQ](https://getseq.net/) on a windows VM. Its good for small use, and very cheap Current ingest rate is averaging 800k events a day into that system, and they only have a few queries being executed on it daily.

### Investment Cost
|-------|-------|
|Seq License|690/year
|VM Windows| $2000/year 
|Disk|$1200/year    
|Ip Address|$15/Year
|Maintenance/Patch|600/Year (1 hr/month at 50/hr)
|Total|**$4,500.00** /Year (rounded)


# The Cloud/Saas
Recently I found that [DataDog](https://Datadoghq.com) is offering log management. 
I have used them for their dashboarding and time metric databases, they have a robust API also that allows you to do a bunch of cool automation. 
Their cost is $75/month for 2.5 million events


I have been looking further into [application insights](https://azure.microsoft.com/en-us/services/application-insights/) for the azure platform. It is an evolving platform, but today it isn't meeting the needs I have for logging. 


## Compliance Concerns
what article is complete without bringing some legal stuff into it.

- PCI - when you log something do **NOT** log the credit card number, use a reference token or something else,  but not the number directly. Depending on what is logged the log management system may become part of the audit-able systems. 

- GDPR - we need to protect personal information, also if we do not provide a business justification for needing the data we shouldnt keep it, so logging PII is not cool either as it can force your logging systems to be included in the resources that have to be tracked and announced how that data is used. 

- Personal Identifiable Information
- [Wikipedia](https://en.wikipedia.org/wiki/Personally_identifiable_information)
- [Department of the Navy](http://www.doncio.navy.mil/contentview.aspx?id=2428) - PII is defined in DoD 5400.11-R, Department of Defense Privacy Program, May 14, 2007
 
