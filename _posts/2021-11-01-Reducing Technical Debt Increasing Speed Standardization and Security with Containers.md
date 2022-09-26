--- 
layout: post 
title: "Reducing Technical Debt Increasing Speed Standardization and Security with Containers" 
description: "" 
categories:  
author: "Chris Hudson" 
meta: "" 
--- 
# Reducing Technical Debt: Increasing Speed, Standardization, and Security with Containers

The path to digital agility starts with reducing your technical debt—the time and money you spend every month, every week, or every day catching up on development. This can include updating to new solutions, finding ways to keep old systems running, or missing out on new opportunities that more efficient solutions would provide.

Let’s say you’re looking to streamline your company’s HR onboarding with automation. You dispatch your crack IT squad to develop a new application. After a few weeks, they have something ready for you.

You eagerly alert your HR team to start using the application, but there’s a problem—it doesn’t work on their machines because it was written on a different version of Java than what they have installed. The time and effort HR exerts to configure their operation to run the application is technical debt.

But containers can solve this problem (and others) before it ever becomes an issue.

Containers revolutionize development by standardizing how you build and deploy applications. They bundle all of an application’s dependencies into a standardized component that can be deployed within your cloud environments or in your own data center. In the example above, if your IT team builds a containerized application, then HR can run it anywhere, regardless of what version of Java is available.

If implemented thoughtfully, container-driven development can reduce your technical debt by delivering notable benefits to your business:

***Speed*** Containers increase agility both on the back end (during development) and on the front end (during use). Their portability enables developers to move applications into the cloud for testing, then quickly delete them, to keep cloud usage to a minimum. Deploying applications becomes much simpler, too, since end users aren’t required to change their environment to run them. The increased operational efficiency means a faster time to market.

Once deployed, containerized applications still move easily. In the cloud, they can scale instantly during periods of high usage. When these surges are anticipated, IT leaders can automate container movement. Tools like Kubernetes, which orchestrates multiple containers, make it possible for containers to self-heal—the tool restarts containers that fail, replaces them, and kills containers that fail health checks.

***Standardization*** One key advantage of containers is the reduction of configuration drift, which happens naturally in every modern enterprise as hardware and software constantly change throughout the organization. With containers, anyone can use applications regardless of their individual system setup.

Not only that, but containers can be used in all phases of a hybrid cloud environment: on-premises, in the public cloud, or on a private cloud server. Their ease of mobility reduces your dependency on any single provider, reducing the technical debt that stems from vendor lock-in.

***Security*** Containers don’t guarantee security on their own, but with proper protocols, they can make your environment significantly safer. For example, implementing regular security checks in your CI/CD pipelines ensures that containers meet compliance throughout their entire lifecycle.

Containers also simplify systems hardening. By defining infrastructures and policies as code, organizations can audit how configurations change, when they change, and who changes them.
