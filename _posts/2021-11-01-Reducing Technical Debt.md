--- 
layout: post 
title: "Reducing Technical Debt" 
description: "" 
categories:  
author: "Chris Hudson" 
meta: "" 
--- 

# Reducing Technical Debt: Goodbye Monolithic System, Hello Quick & Effective Specialization with Microservices

The path to agility starts with reducing your technical debt—the time and money you spend every month, every week, or every day catching up on development. This can include updating to new solutions, finding ways to keep old systems running, or missing out on new opportunities that more efficient solutions provide.

Here’s a familiar scenario: Your contract is up with a third-party vendor to perform fraud checks for online orders and payments. But within your three-tier, monolithic architecture, fraud checks are inextricable from other processes like orders, invoices, and shipping. Accessing or altering your fraud vendor’s info could potentially slow down the entire interface or bring it crashing down.

There is an alternative—breaking down your functions into separate “microservices”.  Microservices—or application programming interfaces (APIs)—are a software design architecture that breaks apart traditionally monolithic systems, allowing you to access or update single applications without affecting the general flow.

## Quick Specialization

A monolithic approach is like having one supersized bookcase that contains every book in your possession. While simple to set up at first, it eventually leads to technical debt as your business grows to incorporate more data, more functions, and more users.

As you scale, locating specific books and adding more to an already full shelf requires effort and ingenuity. Over time, the short-term goal to get to market quickly sacrifices long-term compatibility, quality, and security as legacy monolithic applications become slower and riskier to change. Likewise, a bug in a monolith can have large repercussions while one in a specific process only affects that area.

With microservices, tasks are allocated to specific functions, like “customers” and “orders.” By keeping processes narrow, microservices make it easier to change certain parts of the application (e.g., adding a customer) without breaking other parts of the process (e.g., affecting orders). And if there is a bug, only that specific area is impacted.

This reduces technical debt for enterprise organizations and delivers a number of other benefits:

- ***Cheaper and more effective cloud migration*** In general, cloud infrastructure encourages decoupled processes rather than monolithic applications. Microservices also give you better value in the cloud—using virtual machines to run programs and deploy apps is very expensive, but you can optimize costs by breaking them apart into AMIs before migrating them into the cloud.
- ***More reliable processes*** Delivery pipelines allow for automated building and a range of testing and deployments. Testing new applications is simplified, since the testing environment is contained and won’t impact other critical functions.
- ***Faster time to market*** Decoupling also facilitates better data exchange across the organization by integrating applications, allowing multiple features to be built at the same time. Different teams can work on modules simultaneously, increasing productivity, flexibility, agility and time to market.
- ***Improved scalability*** Microservices allow you to modernize legacy applications instead of relying only on upgrades. They also provide flexibility to scale certain areas up or down based on capacity (for example, “orders” on Cyber Monday). With a monolithic app, you would have to scale up the whole application, which is more complicated.
- ***Greater security*** Within a monolithic application, a breach threatens all of the enterprise’s data. By separating functions, microservices can add authentication, authorization, data sanitization, and even rate limiting to control entry points around sensitive data—including Personally Identifiable Information (PII). If one process fails, the blast radius is contained, and the rest of the platform can continue running. The transition from a monolithic application to microservices is difficult and far from a one-size-fits-all process.
