--- 
layout: post 
title: "Feature Toggle Requirements" 
description: "example requirements for a Feature toggle system" 
categories:  featue toggles
author: "Chris Hudson" 
meta: "feature toggles, toggles, requirement examples" 
--- 

## Overview
# Abstract:
By having Feature Toggles this allows business to launch products, promos, and priority items on demand. 
Business can control the roll out of Features to certain customers or groups, A/B Testing (compares a variation against a current experience), and hide incomplete or risky parts of the system. 

# Client Requests:
- Enable a Feature for a specific application
- Enable a Feature on demand 
- Enable a Feature for certain user population groups (beta testers, A/B Testing)
- Schedule start and/or end date and time for a Feature
- Search available Features for an application and view current status
- Receive an alerted when a Feature is activated
    
# Information Technology (IT) Requests:
- Export from test and import into production environments
- Allow toggles to be turned off quickly to prevent production impact
- Allow toggles to be implemented so code can be integrated faster into production environment
    
# Security Requests:
- Audit trail showing identity, action, time of action, status of action, origin of event, name of affected resource (per PCI 3.2 Req 10)
- Security enabled so only authorized users can view/edit data
- Ensure all PII/PCI data is encrypted during transmission and at rest.
    
# Operations Requests:
- Exception Handling actions are identified
- Identify monitoring needed and actions when monitors alert

# Development Requests:
- Unified toggle environment
- Standard toggle training for adoption
- Feature toggle release model 
- Reliability 
- Time, on/off

# Future enhancement:

    
## Data Dictionary:
# General Terms:
- Feature: Product, promotion (promo), or priority item
- Standard Logging System: file system, Exceptionless, Seq
- Standard Monitoring Systems: Exceptionless for exception handling, Seq for Logging events, Pingdom for up/down monitors, datadog, applicaiton insights
- Audit Event: Track actions of the user within the system and will minimally include the authenticated user name, the action taken, and the datetime of the action
        
# Requirement Elements:
- Abstract: Represents the initial purpose of the project.
- Epic	: A grouping of Features project sized chunk of work
- Feature	: A deliverable set of functionality
- #### Story	: A User #### Story supporting the need for the Feature
- #### Scenario: A contextual action in the scope of the Feature
- Given	: The context for the scenario. Any setup that is needed before testing the scenario
- When	: The action for the scenario. This is the functionality that is executed for this scenario.
- Then	: The expected results for the scenario.

# Types:
- string      : alphanumeric characters 
- datetime    : value of date and time in the format of ISO 8601 format
- integer     : 0 - 2,147,483,647
- boolean     : only two possible values: true or false where true = 1 and false = 0

# Constraints Keys:
- required				: this field is required to have a value
- unique                  : must be distinct
- min length (x)          : x (integer) defining the minimum length of a data type
- max length (x)          : x (integer) defining the maximum length of a data type
- valid characters(...)	: any characters between "(" and ")" will be considered valid for this field
- no restrictions			: no restrictions are applied to the values for this field

## Domain Models:
# Toggle:
- ToggleCode      : string - valid characters(A-Z,a-z,0-9,-,_), min length (3), max length (100), unique, required
- Description     : string - min length (0), max length (200)
- ApplicationId   : integer - required
- ToggleType: UserIds, IP WhiteLIst, IP BlackList, Boolean, Date Range, ActiveBeforeDate, ActiveAfterDate, %Users,   GroupIds, HostName, EnabledDaysOfWeek, EnabledMinVersion 
- Active          : boolean - required
- DefaultState : boolean - required

# Application:
- ApplicationId       :int - required
- Applicaition Name   :string - min length (3), max length (100), unique, required
        
## References: 
- ISO 8601: [https://www.iso.org/iso-8601-date-and-time-format.html](https://www.iso.org/iso-8601-date-and-time-format.html)
- Feature Toggles Definitions: [https://### Featureflags.io/### Feature-toggles/](https://### Featureflags.io/### Feature-toggles/)
- Feature Toggles Advantages: [https://www.slideshare.net/anandagrawal84/### Feature-toggles](https://www.slideshare.net/anandagrawal84/### Feature-toggles)
- Feature Toggles Disadvantages: [http://swreflections.blogspot.com/2014/08/### Feature-toggles-are-one-of-worst-kinds.html](http://swreflections.blogspot.com/2014/08/### Feature-toggles-are-one-of-worst-kinds.html)
- [http://jason-roberts.github.io/### FeatureToggle.Docs/pages/usage.html](http://jason-roberts.github.io/### FeatureToggle.Docs/pages/usage.html)
- [https://www.split.io](https://www.split.io)
- [https://launchdarkly.com/](https://launchdarkly.com/)
- [Google Firebase - Remote Config](https://firebase.google.com/docs/remote-config/?utm_campaign=Firebase_### Featureoverview_education_config_en_06-03-16&utm_source=Firebase&utm_medium=blog)
	- Caching of up to 12 hours https://firebase.googleblog.com/2017/01/firebase-remote-config-loading.html
	- For immediate changes realtime Database, or Message queueing and set flag that update is pending
	- Date stored as string in 

## Requirements
# Epic: Feature Toggle - Internal Application
We want to be able to separate feature active/inactive from code deployments. This will allow us to deliver functionality faster to separate user groups.
## Theme: Toggles
### Feature: Create Toggle
#### Story:
As a [launch planner]
I want to create a toggle for new functionality 
So that the toggles are available for A/B testing, Canary Releases, deploying Features incrementally (aka dark launching), and enabling rapid fail back.
	
#### Scenario: 
	Given a new toggle is requested
	When the all required information is NOT inputted
	Then the REQUIRED_INFORMATION_MISSING error occurs

#### Scenario: 
	Given existing toggle code
	When I Create a new toggle
	then a TOGGLE_ALREADY_EXISTS error occurs

#### Scenario: 
	Given a new toggle with as a unique code
	When the all required information is inputted 
	Then the toggle is created
	And Then an audit event is created
			
### Feature: Retrieve Toggles
#### Story:
As a [launch planner]
I want to view available toggles
so that I can find the one I want to change.

#### Scenario: Toggles unable to be retrieved
	Given Toggles are unavailable
	when I Retrieve all toggles
	Then a TOGGLES_UNAVAILABLE error occurs

#### Scenario: Retrieve all Toggles
	Given Toggles exist
	When I retrieve all toggles
	Then all existing Toggles are retrieved

#### Scenario: Retrieve a specific Toggle
	Given an existing Toggle with a Toggle code
	When I retrieve the Toggle using the code
	Then all Toggle data is received

#### Scenario: Retrieve a nonexisting Toggle
	Given a nonexisting Toggle code
	When I retrieve the Toggle using the code
	Then a TOGGLE_DOESNOT_EXIST error occurs
                
### Feature: Update Toggle
#### Story: 
As A [launch planner]
I Want to update an existing toggle for an existing Feature
So that the toggle will have the correct inforamtion for the Feature

#### Scenario: Update existing Toggle
	Given an existing toggle with code
	When updating the Toggle using the code
	Then the toggle data is updated with the inputted values
	And Then an audit event is created

#### Scenario: Update nonexisting Toggle
	Given a nonexisting Toggle code
	When updating the Toggle values using the code
	Then a TOGGLE_DOESNOT_EXIST error occurs

### Feature: Delete Toggle
#### Story: 
As a [launch planner]
I Want to be able to Delete a toggle
So that we can remove the toggle once the Feature is stable and is available to our customers

#### Scenario: Delete non-existing toggle
	Given a non existing toggle
	When deleting the toggle
	Then a TOGGLE_DOESNOT_EXIST error occurs

#### Scenario: Delete existing toggle
	Given an existing toggle
	When the toggle is deleted 
	Then the toggle is not available for use
	And Then an audit event is created

### Feature: Toggle Types
#### Story:
As a [launch planner]
I want to have multiple ways to grant access to a Feature
so that only those users have access.

#### Scenario:
	Given a Feature is enabled
	When an authorized user attempts to access the Feature
	Then the Feature is available.

#### Scenario:
	Given a user is on an approved list
	When they attempt to access the Feature
	Then the Feature is available.

#### Scenario:
	Given a user is in a group 
	And Given the group is enabled for the Feature
	When they attempt to access the Feature
	Then the Feature is available.

#### Scenario:
	Given a IP List is on an approved list
	When a user with the IP attempts to access the Feature
	Then the Feature is available.

#### Scenario:
	Given a Feature is enabled during a date range
	When an authorized user attempts to access the Feature
	AND When the system date is within the specified date range
	Then the Feature is available.

#### Scenario:
	Given a Feature is enabled for a platform (website, ios, android, api)
	And Given an authorized user is using the platform
	When the user attempts to access the Feature
	Then the Feature is available.

#### Story:
As a [launch planner]
I want to have multiple ways to restrict access to a Feature
so that only those users have access.                

#### Scenario:
	Given a Feature is disabled
	When any user attempts to access the Feature
	Then the feature is denied.

#### Scenario:
	Given a user is on an denied list
	When they attempt to access the Feature
	Then the Feature is denied.

#### Scenario:
	Given a user is in a group 
	And Given the group is disabled for the Feature
	When they attempt to access the Feature
	Then the Feature is denied.

#### Scenario:
	Given a IP List is on an denied list
	When a user with the IP attempts to access the Feature
	Then the Feature is Denied.

#### Scenario:
	Given a Feature is disabled during a date range
	When any user attempts to access the Feature
	AND When the system date is within the specified date range
	Then the Feature is denied.

#### Scenario:
	Given a Feature is disabled for a platform (website, ios, android, api)
	And Given a user is using the platform
	When the user attempts to access the Feature
	Then the Feature is denied.

### Feature: Toggle enacted quickly impacts customers
#### Story:
As a [launch planner]
I want to a Feature status to be immediately be toggled 
so that users can access enabled Features quickly.

#### Scenario:
	Given an authorized user 
	When a Feature is enabled
	and When an authorized user accesses the Feature
	Then that Feature is enabled within the [Service Level Agreement (SLA)]

#### Scenario:
	Given an authorized user 
	When a Feature is disabled
	and When an authorized user accesses the Feature
	Then that Feature is disabled within the [Service Level Agreement (SLA)]

## Theme: Applications
### Feature: Create Application
#### Story:
As a [launch planner]
I want to add new Applications
So that the Toggles may be appropriately grouped

#### Scenario: Create Application with unique slug
	Given Application does not already exist with slug
	When I Create a new Application
	Then the Application is available
	And Then an audit event is created

#### Scenario: Create Application with existing slug
	Given Application already exists with slug
	When I Create a new Application
	Then a APPLICATION_ALREADY_EXISTS error occurs

### Feature: Retrieve Application
#### Story:
As a [launch planner]
I want to retrieve existing Applications
So that I can view the toggles
And So that I can update the toggles

#### Scenario: Retrieve all toggles for an application
	Given Application exist
	When I retrieve all toggles for the specific application
	Then all existing toggles for the specified application are retrieved

#### Scenario: Retrieve a nonexisting Application
	Given a nonexisting Application slug
	When I retrieve the Application
	Then a APPLICATION_DOESNOT_EXIST error occurs

### Feature: Update Application
#### Story:
As a [launch planner]
I want to Update an existing Application
So that the Application will have the correct information

#### Scenario: Update existing Application
	Given an existing Application
	When updating the Application
	Then the Application data is updated
	And Then an audit event is created

#### Scenario: Update nonexisting Application
	Given a nonexisting Application slug
	When updating the Application using the slug
	Then a APPLICATION_DOESNOT_EXIST error occurs

### Feature: Delete Application
#### Story:
As a [launch planner]
I want to Delete an existing Application
So that I will prevent the Application from being used

#### Scenario: Application Deleted
	Given an existing Application
	When Application is Deleted by slug
	Then Application is not available
	And Then an audit event is created

#### Scenario: Nonexisting Application Deleted from Catalog
	Given a nonexisting Application
	When that Application is Deleted by slug
	Then a APPLICATION_DOESNOT_EXIST error occurs

## Theme: Application And Toggles
### Feature: Add Toggle to Application
#### Story:
As a [launch planner]
I want to add a Toggle to an Application
So that the Toggles may be appropriately grouped

#### Scenario: Add Existing Toggle to an Existing Application
	Given I am editing an existing Application
	And Given an existing Toggle
	AND given the toggle is already added to the Application
	When I add the Toggle to the Application
	Then a TOGGLE_ALREADY_ATTACHED error occurs

#### Scenario: Add new Toggle to existing Application
	Given a new Toggle
	When I add the toggle to the Application
	Then Toggle is Available in the Application
	And Then an audit event is created

#### Scenario: Add new Toggle to New Application
	Given a new Application 
	And Given a new Toggle
	When I add the toggle to the Application
	Then the applicaiton and toggle are created 
	and Then the Toggle is Available in the Application
	And Then an audit event is created

### Feature: Remove Toggle from existing Application
#### Story:
As a [launch planner]
I want to delete a toggle
So that we can remove the toggle once the Feature is stable and is available to our customers

#### Scenario: Delete existing toggle
	Given an existing toggle
	When the toggle is deleted 
	Then the toggle is not available for use
	And Then an audit event is created

### Feature: Export Toggles for an Application
#### Story:
As a [launch planner]
I want to Export all toggles for an application
So that we can use them in other environments 

#### Scenario: Export all toggles for an application
	Given an existing Application 
	And Given toggles exist for the application
	When the toggles are exported
	Then the application with all of its toggles are available for use in other systems.

### Feature: Import Toggles for an Application
#### Story:
As a [launch planner]
I want to Import all toggles for an application
So that we can import them to other environments 

#### Scenario: Import all toggles for an application
	Given a standardized file for importing
	When the toggles are imported
	Then the application with all of its toggles are available for saving to the system
	And Then any existing data is not modified


### Feature: Filter applications by name
#### Story:
As a [launch planner]
I want to find applications
So that we can modify the necessary toggles quickly

#### Scenario: Filter application names from user input
	Given the list of application names 
	When the first 3 letters of the application name are inputted
	Then applications names starting with the inputted letters are displayed

## Theme: Security
### Feature: Authentication
#### Story:
As an Enterprise System I want to identify who should access the system 
so that we protect data and allow authorized access to our users

#### Scenario: Attempt access not logged in
	Given I am not logged in 
	When I try to access toggles
	Then UNAUTHORIZED_ACCESS_ATTEMPT event occurs

#### Scenario: Authenticated in but not authorized
	Given I am logged in 
	And Given I am not authorized 
	When I try to access toggles
	Then UNAUTHORIZED_ACCESS_ATTEMPT event occurs

#### Scenario: Authenticated and authorized
	Given I am logged in 
	And Given I am authorized 
	When I try to access toggles
	Then I am allowed access

### Feature: Alert on failed attempts
#### Story:
As an Enterprise System
I want to identify failed access attempts 
so that we can alert and monitor those users to prevent fraud and unauthorized access to PII.

#### Scenario: Multiple failed attempts
	Given an unauthorized user 
	And Given 4 previous failed attempts
	When the user has another unsuccsful attempt
	Then Log FAILED_ACCESS_ATTEMPT event occurs
	And Then UNAUTHORIZED_ACCESS_ATTEMPT event occurs

### Feature: all traffic is encrypted

### Feature: all stored data is encrypted

## Theme: Logging
### Feature: Application Logging
#### Story: 
As an Enterprise System
I want to monitor when errors occur within the system 
so that an alert can me initiated and the error condition is resolved.

#### Scenario: event is logged required information is captured
	Given a logging event occurs
	When the event is logged to the Standard Logging System
	Then application name, environment, action, date and time of action, what system was affected is captured. 
					
#### Scenario: Unexpected condition event is logged
	Given an error case occurs
	When an unplanned event occurs
	Then event is logged to the Standard Logging System.

#### Scenario: event is logged no PII data is in the entry
	Given an error case 
	When event is logged to the Standard Logging System
	Then PII data is not logged.

#### Scenario: event is logged no PII data is in the entry
	Given a logging event occurs
	When the event is logged to the Standard Logging System
	Then PII data is not logged.

## Theme: Monitoring
### Feature: System Health
#### Story:
As an Enterprise System
I want to be notified when the system is unavailable for use
so that we provide the best experience to our customers

#### Scenario: System is not responsive monitoring systems notified
	Given System is responsive
	When it is no longer responsive
	Then Standard Monitoring Systems are notified

#### Scenario: System is monitoried using Standard Monitoring Systems
	Given a new system or application is ready for launch
	When a new system enters production
	Then the app is added to Standard Monitoring Systems
		
#### Scenario: Sub System Degradation is logged
	Given primary system is functional
	When a sub systems is unavailable 
	or When the sub systme is underperforming
	Then event is logged to the Standard Logging System
	And Then the system continues to operate.

## Theme: Reporting
### Feature: Toggle usage
#### Story:
As an [launch planner]
I want to know what toggles are in use
So that we can remove unnecassary toggles

#### Scenario: Toggle is Accessed
	Given: an external system 
	When: the system accesses the toggle
	Then: count is incremented 
	And Then: last accessed date is updated

### Feature: Toggle creation
#### Story:
As an [launch planner]
I want to know what how many toggles were created within a specified date period
So that we can show counts delivered to our customers

#### Scenario: Toggle is created
	Given: an authenticated user
	When: A date range is specified
	Then: the count of toggles created within the date range is displayed
