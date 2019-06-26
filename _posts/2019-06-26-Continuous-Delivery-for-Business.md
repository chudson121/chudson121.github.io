--- 
layout: post
title: "Continuous Delivery for Business"
description: "Continuous Delivery for Business" 
categories:   Business CI/CD
author: "Chris Hudson"
meta: "Continuous Delivery for Business" 
---


# Overview
We value change and build our organization's for adaptability to our markets, field, and technology. 
Continuous Delivery positions the organization to innovate better and faster to meet our customers' needs providing more flexibility in how it delivers features and fixes. 

# Definitions
- Continuous Delivery (CD) - adding features to your platform frequently and on set delivery pattern with the ability to not release the software for production use.
- Continuous Deployment (CD) - the automatic delivery of software changes incrementally and continuously to production.  
- Continuous Integration (code checkin + Build + unit tests run), 
- Continuous Testing (unit tests, functional tests, integration tests, performance test), 
- Constant Monitoring, 
pipeline analytics all point toward an overall trend in the software industry - increasing your ability to react to market changes

Continuous delivery improves velocity, productivity, and sustainability of our development teams. The resulting process change allows us the ability to rapidly, reliably, and repeatedly deliver new features and enhancements at a lower risk with minimal manual overhead. Specific sets of features can be released to specific customers, or released to a subset of customers, to ensure they function and scale as designed. Features can be tested and developed, but left dormant in the product, baking for multiple releases. This stabilizes releases, reduces errors and reduces the amount of time and resources it takes to deploy applications. When our marketing department wants that "big splash" at conference - With continuous delivery, it's not only possible, it's a trivial request.

# Velocity  
Reduce shelf time of new features as we are pressured to deliver more and faster CD allows us to do it with safe repeatable process. With a low Time To Market (TTM), we have a better chance to outmaneuver our competition and stay in business. Without quality, speed is useless, having the tests automated on every commit ensures the feedback loop is short and quickly identifies regression bugs.

# Productivity
Productivity increases when tedious and repetitive tasks can be performed by pipelines instead of humans. 
This lets teams focus on vision while pipelines do the execution. Teams can investigate issues reported by their pipelines and once they commit the fix, pipelines run again to validate whether the problem was fixed and if new problems were inadvertently introduced. Orchestrating and simplifying the tools decreases the complexity, allowing the teams to focus on the features. 

# Sustainability
We are using technology to differentiate instead of working harder, we work smarter, and delegate the repetitive work to machines. Automated pipelines reduce manual labor and lead to eventual savings since personnel is more expensive than tools, this also allows our personnel to focus on delivering new and improved features and functionality rather than the tedious and repetitious work flow. 

## History for one of my clients
### 2016 Devops group started
- 73 deployable apps
- 464 user stories delivered
- 38 Prod deployments/month
- 89.66% Uptime
- Code deployments were manually done and production releases were major events with significant down time

### 2017 Continuous Integration allowed us to deliver 200 users stories per month   
- 182 deployable apps
- 2200 user stories delivered 
- 43 Prod Deployments/month
- 97.36% Uptime 
- code releases major scheduled events with down time

### 2018 Platform at Scale 
- 218 deployable applications 
- 3000 user stories delivered 
- 56 Prod Deployments/month
- 98.98% Uptime 
- code releases major events down time reduced to 5 minutes

### 2019 Continuous Delivery - allowed us to deploy in 20 minutes from code check-in to customers hands
- 154 deploy-able applications
- 1113 user stories delivered (YTD - As of End April)
- 126 prod deployments/month
- 98.30% uptime
- Code releases are a non-event (zero down time deployments) for 146 apps, developer triggered by check-in to master branch
- Over 1M hits/month


# References:
- [Atlassian CI/CD](https://www.atlassian.com/continuous-delivery/principles/business-value)
- [Dave Nicolete](https://www.leadingagile.com/2017/11/whats-the-value-of-continuous-delivery/)
- [Tim Mueting](https://www.ca.com/en/blog-automation/the-real-business-value-of-continuous-delivery-automation.html)
