---
layout: post
title: "Project Vs Product"
description: "Project Vs Product teams"  
categories:   Agile
author: "Chris Hudson"
meta: "Agile Product teams project teams" 
---

# Slipping backwards?
Recently a client I am working for had a discussion around moving back toward project teams vs using the current Agile teams that were created during the transition to Agile. Some of the reasons for changing back to project based teams were: the projects were going to be large (one of the projects is a large ERP implementation) and there were alot of unknowns as to the api's and sub systems that are needed to be changed, so the thought process was to utilize the dev team as a shared resource pool.

I brought up some of the points below but wanted to summarize this info here:

# Project teams vs product teams

## Stuff that is the same:
- Decide what features (milestones) are going to be delivered
- Create It
- Test It
- Ship It

## Project team: 
Dissolves at the end of the project, team members are changed out and move along to the next project to do.

# Advantages: 
- assembled based on need - can change to different projects easily.
- focused on the project deliverable 

# Disadvantages: 
- Production Support is someone else's problem - there are never production bugs right?
- new enhancements require a new project, prioritization, funding, etc
- Wont know how long it will take to get to done.
- Big Up front Designs (BFUD) - trying to have all the answers before development work begins.
- Big Bang deployments - takes a long time before value is delivered to customer. 

![Ops Problem Now](https://zeroturnaround.com/wp-content/uploads/2014/03/Screen-Shot-2013-07-17-at-12.05.27-PM.png)  

Project Teams ask itself
> What is the next thing I get to work on?


## Product teams: 
own a slice of the business [functions/business unit], along with all related api's, ui's, and function's of the product. 

# Advantages: 
- This decreases dependencies between services.
- clear ownership which increases quality because ownership breads responsibility to make things better (pain is a great teacher).
- longer term goals 
- short delivery cycles - Time boxed to 2 week sprints (most teams), easier to commit to what can be done, and use velocity metrics to predict how long the set of features will take to deliver. 
- Provide integrated technology solutions
- Longer term subject matter expertise.

# Disadvantages:
- Skill sets are different 
    - Product Managers - must understand the Tech along with the Business - they speak for the business
    - Product Owner - needs to have the authority to make decisions on what features make it or are cut, promote the product, take feedback from stakeholders and customers, and must make themselves available to the team
     

They Start the journey with get it working, git it working repeatedly, then enhance 
    
- Decide what features are going to be delivered
- Create It
- Deploy It
- Promote It
- Feedback It 
    - what customers are saying about it and then do the next experiment.
- Enhance It

Product Teams ask itself
> What is the next thing we change to make our product offering better for Customers?





## References:
- [CBC](https://medium.com/cbc-digital-labs/how-switching-to-product-based-work-changed-our-corporate-culture-for-the-better-cd89a39cb499)
- [Thoughtworks](https://www.thoughtworks.com/insights/blog/project-vs-product)