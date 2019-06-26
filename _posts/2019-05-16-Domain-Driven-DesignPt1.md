---
layout: post
title: "Domain Driven Design Pt 1"
description: "Domain Driven Design E-Commerce platform"  
categories:   DDD
author: "Chris Hudson"
meta: "Domain Driven Design E-Commerce platform" 
---

# Purpose
The purpose of DDD is to:
DDD allows developers, domain experts, DBAs, business owners, and (most importantly) clients to communicate effectively with each other in order to solve problems.

- Provide principles & patterns to solve difficult problems
- Base complex designs on a model of the domain
- Initiate a creative collaboration between technical and domain experts to iteratively refine a conceptual model that addresses domain problems - [Raymond Bryant Jr.](https://simpleprogrammer.com/importance-domain-driven-design/)

# Advantages
- Patterns: Domain-Driven Design gives software developers the principles and patterns to solve tough problems in software and, at times, in business.
- Business Logic: Domain-Driven Design creates business logic by explaining requirements from a domain perspective. Conceptualizing the system software in terms of the business domain, reducing the risk of misunderstanding between the domain experts and the development team.
- Successful History: Domain-Driven Design has a history of success with complex projects, aligning with the experience of software developers and software applications developed.

# Definitions
- Context: The setting in which a word or statement appears that determines its meaning. Statements about a model can only be understood in context.
- Model: A system of abstractions that describes selected aspects of a domain and can be used to solve problems related to that domain. It is the intimate link between the model and the implementation that makes the model relevant and ensures that the analysis that went into it applies to the final product.
- Ubiquitous Language: A language structured around the domain model and used by all team members to connect all the activities of the team with the software.
- Bounded Context: A description of a boundary (typically a subsystem or the work of a specific team) within which a model is defined and applicable.
    - "A set of specific software models, a specific solution expressing its own ubiquitous language.
    - It is a desirable goal to align Subdomains one-to-one with Bounded Contexts.
    - Does not necessarily encompass only the domain model. It often marks of a system, an application and / or a business service.
- Entity:
    - We design a domain concept as an Entity when we care about its individuality, when distinguishing if from all objects in a system is a mandatory constraint. An Entity is a unique thing and is capable of being changed continuously over a long period of time.

## First level distillation into domains
![Domain Level 1](/Files/blog/1stRoundDomain.JPG)

# Business
- Supply Chain
- Legal
- Finance
- Customer Service

# Territories

# IT
- App Dev
- PMO
- Network Services
- App Support/Site Reliability Engineering
- ? Reporting

# Sales
- Product
- Distributor monetisation (Sales)
- Product monetisation (Marketing)


Example [Support Context](https://martinfowler.com/bliki/images/boundedContext/sketch.png)

## References
- [Domain-Driven Design: Tackling Complexity in the Heart of Software](https://www.amazon.com/Domain-Driven-Design-Tackling-Complexity-Software/dp/0321125215/ref=sr_1_3?crid=1M72P4RSSCYU3&keywords=domain+driven+design&qid=1558010706&s=gateway&sprefix=domain+d%2Caps%2C166&sr=8-3)
- [Making a case for Domain Modeling](https://hackernoon.com/making-a-case-for-domain-modeling-17cf47030732)
- -[Martin Fowler](https://martinfowler.com/bliki/BoundedContext.html)
- [DDD and Legacy Systems](http://domainlanguage.com/wp-content/uploads/2016/04/GettingStartedWithDDDWhenSurroundedByLegacySystemsV1.pdf)
-[Implementing Domain Driven Design Vaughn Vernon](https://www.amazon.com/s?k=implementing+domain+driven+design&gclid=CjwKCAjwlPTmBRBoEiwAHqpvhdVa2Wu74MOajqxnNJ_pSTfdm8hFR0S24-KIVk3eudsAfLZQBQalJBoCx20QAvD_BwE&hvadid=177148931884&hvdev=c&hvlocphy=9012281&hvnetw=g&hvpos=1t1&hvqmt=e&hvrand=3985997389831383328&hvtargid=kwd-48166794891&hydadcr=16434_9739212&tag=googhydr-20&ref=pd_sl_9b0pg2eh2j_e)
[Domain Driven Design: A "hands on" Example by Suarte](https://www.codeproject.com/Articles/1094773/Domain-Driven-Design-A-hands-on-Example-Part-of-2?display=Print)
[A comprehensive Domain-Driven Design example with problem space strategic analysis and various tactical patterns.](https://github.com/ddd-by-examples/library)