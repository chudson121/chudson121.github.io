--- 
layout: post 
title: "Site Reliability Engineering   SRE" 
description: "" 
categories:  
author: "Chris Hudson" 
meta: "" 
--- 
# Site Reliability Engineering

## Summary

SRE is bringing the rigor of software engineering to IT (INFORMATION TECHNOLOGY) Ops efforts. Growth in SRE is growing and more operational efficiencies are required within digital transformations. Key stats SLI (Service Level Indicators), SLO (Service Level Objectives), & SLA’s all tying the application performance to the organization goals. Impacted areas and vendors are vast and maturity in the area is still growing.

## What

***The Problem Worth Solving***

In an application life cycle, people first wrote the application, putting forth a lot of engineering discipline and thought. And then they pushed it into production. (“The History of Site reliability engineering (SRE) - enov8”) Then, once it was live and in production, they put it in maintenance mode.
They did not actively work on it unless users wanted more features or unless there was a problem. In fact, they put little engineering effort into running the application for the years that it provided value.

 “Ben Treynor, who is the founder, defines SRE in this interview [Why SRE is important. What is SRE ?”](https://landing.google.com/sre/interview/ben-treynor.html)  
“Fundamentally, it’s what happens when you ask a software engineer to design an operations function…So SRE is fundamentally doing work that has historically been done by an operations team, but using engineers with software expertise, and banking on the fact that these engineers are inherently both predisposed to, and have the ability to, substitute automation for human labor.”

“Site Reliability Engineering is a discipline that incorporates aspects of software engineering and applies them to infrastructure and operations problems.’” (“Site Reliability Engineering: What is it? — DevOps Institute”) 

SRE principles are to manage availability, latency, performance, efficiency, change management, monitoring, emergency response, and capacity planning. “They can also function as support engineers, leveraging monitoring, capacity, and optimization automation tools. Their focus is on non-functional requirements of availability, performance, security, and maintainability. - “DevOps vs. ITIL 4 vs. SRE: Stop the arguments | The ...”

They link software, systems, and operational engineering to streamline, efficient recovery/resiliency (self-healing, autoscaling, proactive troubleshooting/preventative measures), focusing on entire platform end to end rather than specializing in a specific area and using software engineers to solve operational issues.

## Leveraging observability

- First you need to understand the data
- determine strategies for system performance
- Implement strategy to improving overall performance and process of development and operations teams for “Production” responsibility/Environment
  - System architecture and interservice dependencies
  - Instrumentation, metrics, and monitoring
  - Emergency response
  - Capacity planning
  - Change management
  - Performance: availability, latency, and efficiency

[DevOps](https://www.redhat.com/en/topics/devops) is an approach to culture, automation, and platform design intended to deliver increased business value and responsiveness through rapid, high-quality service delivery. SRE can be considered an implementation of DevOps. (“What is SRE? - Red Hat”)

“Faster application development life cycles, improved service quality and reliability, and reduced IT time per application developed are benefits that can be achieved by both DevOps and SRE practices.” (“What is SRE? - Red Hat”)

## Why

When developers are fixing numerous issues in production, they’re not building new features and services. SRE principles allow engineers to focus on work that drives value within their specific disciplines. Developers can focus on writing new code and pushing out new products, SRE teams can focus on observability and [monitoring and alerting](https://victorops.com/monitoring-and-alerting/), and operations teams can focus on testing, configuration, and production upkeep. “SRE can act as a highly strategic function within the business, allowing you to focus on the value behind projects and not just projects themselves.” (“What Does Sre Mean - Know Anything | WhatisAnything.com”)
Site reliability engineers can create KPIs (Key Performance Indicators) and track service health all the way through to [costs of downtime](https://victorops.com/blog/how-much-does-downtime-cost) or lost productivity. (“What Does Sre Mean - Know Anything | WhatisAnything.com”) Tying SRE metrics back to the KPIs of the business will show product, sales, marketing, and customer support the value brought in due to system reliability. More stringent SLAs, SLOs and SLIs could potentially help the company close more deals and provide a competitive advantage over competitors. But, more specifically, let’s look at some of the key benefits that teams can expect from SRE. [Value of SRE](https://victorops.com/blog/showing-the-value-of-site-reliability-engineering-sre)

We have a limited amount of human capital available to maintain systems and as those systems become more complex, even easy tasks like a reboot becomes operationally costly, having automation in place allows us to scale to the complex systems we are building and then allows the workforce to focus on more innovative solutions rather than mundane work.

Historically Developers were only concerned about creating new features while operation members were concerned about the efficiency and reliability of the software - this caused friction as the 2 are not easily aligned. There is a continued need for collaboration, resilient systems, performant systems (UX).

“SRE can act as a highly strategic function within the business, allowing you to focus on the value behind projects and not just projects themselves” (“What Does Sre Mean - Know Anything | WhatisAnything.com”) Tying SRE metrics back to the KPIs of the business will show product, sales, marketing, and customer support the value brought in due to system reliability.

## Goals

All infrastructure, operations, monitoring, performance, scalability, and reliability factors are accounted for in a nice, lean, and automated system using SRE principals. (“Why is Site Reliability Engineering Important? - DevOps.com”)
Monitor and improve the reliability of systems - Service Level Objectives from the customers point of view - what happens when the metric is triggered. Anticipate failures and solve them - Reduce Mean Time to Repair (MTTR) how do you detect issues while reducing blast radius to customers - A/B testing.
Automate Operation tasks - (get rid of Toil) - this requires engineers to have time to automate the mundane (form of technical debt); IaC (Infrastructure as Code), Config as Code. Speed and Performance - Enhance workflows between developers and Infrastructure operations teams.

[Why SRE is important. What is SRE ?](https://medium.com/adservio/why-sre-is-important-e6d72b7b3ac4)

## Challenges

DevOps and SRE are intimately connected, be careful not to construct new silos having SRE focus on reliability only
Deploying value rapidly and availability of that value is key
Standardizing the measurement of reliability (it's not just uptime). Renaming your Sysadmins or App Support to SRE without upskilling does not end well. Software engineering principles need to be a part of the role. Upskill your developers to know more of infrastructure and operations. With the ability to scale infinitely controlling and administrating infrastructure becomes a massive undertaking.

## Best Practices

Represented in delivery teams (helps with feedback cycles, information sharing/learning) - reliability concerns affect customers and needs to be addressed in product roadmaps.
Using a Tech Debt preventer such as an Error Budget If there is a breach of SLO, there must be a consequence.

For example, if there are 1 Million transactions per month and we have a 99.9% SLO, it means that we can have 1000 transactions in a month to fail. This is an error budget. “This means that we can do new releases, patches, modification, etc., which can result in a maximum of 1000 transactions failing due to those.” (“Site Reliability Engineering: What is it? — DevOps Institute”) If there is any more, we may need to stop new releases till we make the system stable. SREs (Site Reliability Engineers) use 50% of their time for Operations work and 50% on Development work and no more than 25% on-call. (“Site Reliability Engineering: What is it? — DevOps Institute”).

- Observability is more important than monitoring (proactive vs reactive).
- Automated Tests to verify reliability and performance
- Antifragile patterns and Chaos Engineering
- Security testing as part of the process
- SRE's become the experts in how the system is connected - allows them to put in sensors where they need to be (critical joints) and feed the information needed for On-Call responders
- Moving from traditional NOC (Network Operations Center) to modern NOC (leverage AI/ML to respond, alert, automated response systems – observability platforms)
- “Provide product development with a platform of SRE-validated infrastructure, upon which they can build their systems” (“Google - Site Reliability Engineering”)

KPI's

- Mean time to acknowledge (MTTA) – how long does it take to notice something occurred
- Mean time to resolution (MTTR) – how long until its fixed
- Average response Time - how long does it take to get the right people on the issue
- Total number of incidents
- Customer impacting downtime/cost of downtime
- Mean time between failures (MTBF) or Avg time between incidents – how often are things going badly


|SRE concept| Security measurement concept (Regulator/Risk Team terminology) |
|------------------------------------------|-----------------------------------------------------------------|
|Service level indicators (SLIs)| Key Performance Indicators, Key Risk Indicators |
|Service level objectives (SLOs)| Indicator thresholds, SLAs |
|Service level agreements (SLAs)| Escalation standards, board limits |

## References

[Google - Site Reliability Engineering (sre.google)](https://sre.google/workbook/table-of-contents/)  
[Showing the Value of Site Reliability Engineering (SRE) | VictorOps](https://victorops.com/blog/showing-the-value-of-site-reliability-engineering-sre)  
[Why sre is important](https://medium.com/adservio/why-sre-is-important-e6d72b7b3ac4)   
[Site Reliability Engineering: What is it? — DevOps Institute](https://www.devopsinstitute.com/site-reliability-engineering-what-is-it/)  
[Why SRE is important. What is SRE ? | by Adservio, IT quality experts. | ADSERVIO | Medium](https://medium.com/adservio/why-sre-is-important-e6d72b7b3ac4)  
[https://www.devopsinstitute.com/site-reliability-engineering-what-is-it/](https://www.devopsinstitute.com/site-reliability-engineering-what-is-it/)   
[https://www.redhat.com/en/topics/devops/what-is-sre](https://www.redhat.com/en/topics/devops/what-is-sre)   
[How SRE teams are organized, and how to get started | Google Cloud Blog](https://cloud.google.com/blog/products/devops-sre/how-sre-teams-are-organized-and-how-to-get-started)  
https://enterprisersproject.com/article/2019/11/devops-vs-itil4-vs-SRE?sc_cid=70160000000h0axaaq (https://enterprisersproject.com/article/2019/11/devops-vs-itil4-vs-SRE?sc_cid=70160000000h0axaaq)  
[The History of Site reliability engineering (SRE) - enov8 - enov8](https://www.enov8.com/blog/the-history-of-sre/)  
[New-Age IT Ops Based on the SRE Model (wiprodigital.com)](https://wiprodigital.com/2020/04/28/new-age-it-ops-based-on-the-sre-model/) 
[Establishing SRE Metrics that Fuel Collaboration and Success (bizops.com) ](https://www.bizops.com/blog/establishing-sre-metrics-that-fuel-success)
[What's the Difference Between DevOps and SRE? (class SRE implements DevOps) - YouTube](https://www.youtube.com/watch?v=uTEL8Ff1Zvk&ab_channel=GoogleCloudTech)  
[SLIs, SLOs, SLAs, oh my! (class SRE implements DevOps) - YouTube](https://www.youtube.com/watch?v=tEylFyxbDLE&ab_channel=GoogleCloudTech)  
[New Relic Best Practices](https://newrelic.com/blog/best-practices/best-practices-for-setting-slos-and-slis-for-modern-complex-systems?utm_source=linkedin&utm_medium=organic_social&utm_campaign=amer-fy22-q4-slm&utm_content=blog)  
