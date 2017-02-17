---
layout: post
title: Continous Integration and Continous Deployment (CI/CD) of a .Net Core app using Jenkins and Azure.
---
# [St Pete .Net Meetup - June 2017 Abstract](https://www.meetup.com/St-Pete-NET-Meetup/)
- Do you want to learn how to create the process of continually compiling and running tests, so that you know your code is ready to go to production whenever your business unit wants it?
- Have you ever said "test and prod are different"?
- Is there any reason not to have your customers using your new code right now?
- If any of these apply then the come join me as we take a journey through CI/CD.

We will go through the steps of building this automated process so your apps can go through a repeatable process and quickly get your application into production. In the end you will see a .net core application unit tested, functionally tested, and continously deployed  into an azure webjob. 

# Chris Hudson
My passion is breaking down the barriers, building and improving processes, so that the engineering, testing, operations, and business teams work better and smarter. I help businesses bring their products and services to market faster through process automation and organizational changes. I use continuous integration and continuous delivery (CI/CD) to move software quickly and safely from development to production.
	
- [Blog](http://www.devopsbastard.com/)
- [GitHub](https://github.com/chudson121)
- [Email](chris@devopsbastard.com)

- [St Pete .Net Meetup](https://www.meetup.com/St-Pete-NET-Meetup/)
- [St Pete .Net Meetup Video's](https://www.youtube.com/channel/UC_kdG2Reanc7Bo3K0XOYZ-g)

	
# Outline:
- Who am I
- What is CI
	- Check-in into source code causes compilation and runing of unit tests every time. 
	- Feature Toggles

- What is CD
	- if tests pass deployment package is shipped to test environment for functional/integration tests
	- If those pass ship it to prod
	- Fast Failback capabilities
		
- Why do these?
	- Business reasons
	- Developer feedback cycles
	- Testing feedback cycles

- When should CI/CD be used or started

- Walk through of a .net aaplication
	- Git --> Jenkins --> Azure webapp, deployment slots --> production.
	- Parts of the Jenkins build
		- Compile
			msbuild
		- Unit Test
			msTest/Xcode
		- Package
			msDeploy
		- Artifact Management
		- Deployment
			msDeploy
		- Integration Tests
			Xcode

