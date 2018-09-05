--- 
layout: post 
title: "SDLC Overview" 
description: "" 
categories:  
author: "Chris Hudson" 
meta: "" 
--- 

![Detailed Diagram of Agile SDLC](/Files/blog/agileLifecycleDetailed.jpg)

[Agile System Development Lifecycle](http://www.ambysoft.com/essays/agileLifecycle.html#Retirement) 

# Definitions
- Epic - High level overview of the project usually consisting of multiple features to be delivered
- Feature - is a client-valued functionality (feature) perspective. 
- User Story - describes how the system should act for a specific user with a specific action.
- Task - the todo's for each team member to deliver the user story
- Pull request - A process to communicate that changes to the system are ready to be reviewed 	[See Dev Process documentation on Pull request process]
- Peer Review - verifies coding standards, security standards, and architectural design standards are adhered too.

# Testing Types:
- Unit Test - smallest testable parts of an application, called units, are individually and independently scrutinized for proper operation
- Functional test - describes what the system does by feeding inputs and examining outputs.
- Integration test - program units are combined and tested as groups in multiple ways (spanning to database, external services etc) 
- Load Test - baseline performance of the app verifying Service Level Agreements
- Stress Test - max amount before app becomes unresponsive
- User Acceptance Tests - testing of user needs, requirements, and business processes conducted to determine whether a system satisfies the acceptance criteria and to enable the user, customers or other authorized entity to determine whether or not to accept the system
- Smoke/Product Verification Test - verifies all pieces are present, touches all major components, exercises new functionality 

## Manual/Subjective Testing
- Usability tests- systematic observation under controlled conditions to determine how well people can use the product.
- Exploratory Test - the personal freedom and responsibility of the individual tester to continually optimize the quality of his/her work by treating test-related learning, test design, test execution, and test result interpretation as mutually supportive activities that run in parallel throughout the project

Feature enable-ment - use Feature toggles to separate deployment from activation ()
A/B testing - comparing two versions of a web page/feature to see which one performs better
Canary releases - reduce the risk of introducing a new software version in production by slowly rolling out the change to a small subset of users before rolling it out to the entire infrastructure and making it available to everybody

## Pre Release Activities:
- Epic/Feature/User Stories created
- Source Code Created
- Unit Tests completed
- Peer Review completed
- Pull Request completed

## Software Distribution Procedures
- All applications are deployed using a centralized deployment system. 
- The system tracks when deployments occur, who initiated the action, and the results of the deployment.

## Application is released into Testing Environment
Automated tests are run:

- Functional Tests
- Integration Tests
- Load Test
- Stress Tests
- Manual Testing is completed 
- Usability tests
- Exploratory Test 

## Planning Releases
Criteria for release to production: 

- User story state moves to "Release Ready" this indicates that it has been accepted by the business for code release into production. 
	- completes the requirements for the system 
	- all test cases are passed
	
## Production Validation

- Production validation testing (aka Smoke testing) occurs once the code is migrated to the production environment.
- Successful production valadition the state of the user story is pending production activation indicating the user story is ready for the Feature to be enabled.

## Communications

- After Production releases, changes are communicated to the field.

## Monitoring

- System Up/Down
- System Errors and Exceptions 
- Page load time/Route execution time
- Feature usage
- Abnormal user behavior
- Authentication failures
- Primary Key Indicators needed by Business Sponsor




