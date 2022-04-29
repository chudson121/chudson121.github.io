---
layout: post
title: DevOpsRoadMap2017
description:
categories:
author: Chris Hudson
tags: 
meta:
---
# Thoughts for the Roadmap

What business problems are we solving for/do we need to solve for

- enrollments/orders - drive these numbers up.
- requirement gathering and distribution of prioritized requirements.
- What business level drivers do we have
- What pains do we have across silos
- What PKI are we not tracking but should be
- What bottle necks do we have

## 2017 Team Accomplishments:
- All apps, sites, etc. are now in the CI/CD pipeline
- Migrated in-house infrastructure for developers to the cloud (business continuity spurred by Hurricane Irma)
- All cloud disk storage encrypted
- All API calls using secure https
- Migration of Exigo SQL Servers to High Availability (safer, less down-time)
- CloudFlare Enterprise to mitigate denial of service attacks, enable better caching strategies to service our customers faster, provides more secure data traffic options



## Look ahead to 2017
- Goals:
    - Security
    - Continuous Delivery (CD)
        - Determine which apps/services we can fully automate the delivery pipeline (automated deployments to prod)
    - Monitoring of all applications (will require a lot of cross department coordination)
    - Mitigate single point of failure risks (personnel)
     
- Projects:
   - Q1
        - Run the Engine
            -    Deployments
            -    New sites
            -    infrastructure systems
                -    Package Mainte systems
                -    DBs Backups
        - Monitoring strategy
            - Identify all sites, ensure they are add to pingdom
                - create up time stats, and webhits by month
            - Monitor queues/caches (appinsights --> datadog?
            - Critical KPI (orders/enrollments)
        
        - Build system enhancements
            - integrate api gateway scripts
            - Jenkins --> tfs 
            - auto add monitors
            - Package maintenance (Artifactory) 
        - Security
            - start environment segmentation
 - Q2
- Run the Engine
  - Deployments
		-    New sites
		-    infrastructure systems
		-    Package Maint. systems
		-    DBs Backups
	- Monitor queues/caches 
	- Critical KPI (orders/enrollments)
	- Build system enhancements
	            - auto add monitors
	- Devops Available for all launches

-Q3
	- Run the Engine
	-    Deployments
	-    New sites
	-    infrastructure systems
	-    Package Maint. systems
	-    DBs Backups

-	Monitor queues/caches 
-	Critical KPI (orders/enrollments)
-	Self service new app
-	Config service implemented

-Q4 
- Run the Engine
    -    Deployments
    -    New sites
    -    infrastructure systems
    -    Package Maint. systems
    -    DBs Backups
- Production connection strings pointed to exigo HA
- Finish off db scripting tools
- Finish off console server
- Planning azure segregation
    Custom url cleanup
    App plan cleanup
    Resource group cleanup


Done
1. R&D - Esuite breaking news cache refresh
2. BI team fully off of tfs 2013 hardware 
3. Decom tfs 2013 servers 
4. DEV - Mobile app store deployed
5. NA - DEV - Jenkins 2.x upgrade plan
6. NA - DEV - Figure out Jenkins build - work item association  on mac
7. DEV - New azure site via code 
8. NA R&D - docker containers to isolate jenkins slaves so we can support 4.7, 4.6.2, common 1.6, 2.0 etc
9. R&D - Introduce automated testing framework - cucumber, fitenesse, robot (newman/postman)
10. R&D - jenkins promotion steps and using application name as a variable
11. TFS Migration to VSTS
12. Decom TFS Systems
13. Azure setup to DR static content CDN + Blob (static.itworks.com/public-static/css/autoSuggest.css)
14. DEV - Create azure webapp via automated system
15. RE - Exigo api changes api.exigo.com = companykey-api.exigo.com (Sep)
16. RE - App settings removed from azure (webapi is last one)
17. DEV - Database scripts deployments for exigo db (in test not prod yet)
q42017 Create and formalize on call rotation 
q42017 Exigo api url change implementation plan.
q42017 Split devops repo into more distinct areas


Current project
	Webjob schedulare able to deal with time changes
	Db scripting to prod
	Db tables using exigo apis
	Resharper code coverage
	
Oct 2017
	Projects:
		Connection string for HA Exigo in Test is complete
		Connection string for company specific exigo api is complete for prod
		Data Script migration completed for new SB1 HA system
		Buddy Build for Mobile apps
		Cost savings initiatives on Azure resources
		Netcoreapp 2.0 released and build system updated
		
	Support:
		Builds (4 new applications)
		Deployments
		Troubleshooting

Sep 2017
	Migrated to VSTS from TFS on premise
	Artifactory migrated to azure
	Application created for standard Azure site creation
	Decommed on premise tfs systems

Aug 2017 
	Artifactory upgrade
	Automated - Azure/Datadog/Pingdom with current sites
	Created 1st part for metrics on service bus
	Configuration Service - implementation plan established
	Migrating Batch jobs from console Server to webjobs to enable better scaling and cost savings
	BI Source code moved off of old TFS
	Decom tfs 2013 servers 

Jul 2017
	Stored Procs, Views, and indexes are now auto deploying to sandbox databases (table creation/alter remains in exigo portal)
	Prepared Audit info - process of ci/cd traceability, current sdlc
	Exigo endpoint converted to us ssl for all apps (one of the consoles isn't updated)
	Reporting Services apps Migration from old tfs system to GIT

June 2017
	All things green carpet conference - survived multiple issues and had a huge fun moving to almost continuous delivery of applications!
	Huge jump in new sites, and additional monitoring (20 new prod sites)
	Began the project to use the HTTPS endpoint in exigo for all apps
	Created/Modified several dashboards for the exigo server uplift
	Begin project to migrate static content from rackspace to azure
	Helped identify slow performing apps and operations to increase performance on the platform
	Started on SQL deployment automation

May 2017
	Configuration Service coming along even with the large number of deployments that have been going on.
	New SSL certs applied to CI infrastructure
	Supporting new teams with team creation/query setups in TFS
	QA Functional Test jobs created

Apr 2017
	Cleaning up the environments by decomming several old services 
	A bit of firefighting this month.
	Great collaboration with QA regarding functional testing

Mar 2017
	Paypal in production!!!
	Android deploying to Production Store
	ChangeSet Tool - allowing us to see all workitems in between production releases
	Upgraded all ssl certs for CI/CD systems.
	Upgraded build system for latest Microsoft frameworks.

Feb 2017
	Conference and the new catalog system kept us busy during Feb
	Changed apparel site over to our infrastructure
	Infrastructure scaling for conference
	Andrew was introduced to console app deployments (fulfillment engine) and did several deployments this month
	Matt our new devops member is working on the configuration microservice

Jan 2017
	5 deployments days to production sites, deploying 40 applications.
	Artifactory is now hosting our nuget, ios, android, and npm packages
	Jenkins and TFS are now integrated so user stories have build number and link
	We now have webjobs running in azure (catalog builder)
	Api gateway is scripted for add/updates - allowing us to deploy quicker and reduce dev - devops back and forth
	Datadog updated with azure endpoints for better visibility/monitoring


	

Areas Of Concern
## Productivity 
- build time
- deployments test/prod
- Time to Market 
- user stories deployed count

## Quality
- Prod Bug Count
- Number of Rollbacks
- PCI test pass rate
- Code Coverage
- Number automated unit tests
- Number Automated Functional tests
    - allows faster feedback when regression failures occur.
    - creates a living specification/requirement of the systems

## Monitoring/Monthly Stats
- exception counts per app
- performance Avg Response time?
- Cloud Infrastructure - uptime
- Devops Infrastructure - uptime
- Test/Prod - uptime
- MTTR - issue identified to production fix in hours
- hits/site
- device traffic/app
- exceptions per app
- availability/UpTime/App
- feature usage (datadog metric?)
- Caches errors/waittime, refreshes
- queues errors/waittime
- console apps monitored for failures
- 3rd party endpoints
- orders by type, by 15 minute blocks?
- enrollments by type by 15 minute blocks?
- Logins/minute/app
- Fullfillments by ??
- Transaction Processing stats Success/regected/failed/contact cs

# Cloud Architecture
	- Strengthen microservice approach 
	- Security boundaries between environment (WAF, Firewall rules, environment isolations - test from prod)

## Cloud centralization 
	- One off systems in rack space applications can be migrated to azure for cost savings on the vm's and ease of deployments, metrics, monitoring, and alerting

## Liaison between all units to enhance collaboration.
- training's
- process enhancements based on Business unit feedback

# Log Aggregation
    *[Primary Key Indicator]* MTTR/Uptime
    *[Business Value]* Reduce costs by addressing errors early
    - azure, aws, rackspace, HQ, all in one place
    
# Monitoring/Alerting system 
    *[Primary Key Indicator]* MTTR/Uptime 
    *[Business Value]* Reduce costs - know when errors occur preferably before customers report it, and get it repaired quickly avoiding customer impacting outages
    - what do we monitor
        - enrollments
        - orders
    - what do we do when process fails
        - sop's?
        - contacts
        - Incident management process

# Connection string password resets

    *[Primary Key Indicator]* Reduce attack vectors
    *[Business Value]* Avoid Costs by making it difficult to infiltrate our systems
    - On deployment change password on 'cold' account and change username to 'hot' account
    -  encrypt web.config

