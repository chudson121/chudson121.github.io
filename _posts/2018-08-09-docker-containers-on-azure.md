--- 
layout: post 
title: "docker containers on azure" 
description: "Docker Containers running in Azure, the 3 different ways that i have found to do it" 
categories: architecture, azure, docker, containers, app service  
author: "Chris Hudson" 
meta: "architecture, azure, docker, containers, app service" 
--- 

# Overview
Docker containers are very cool technology to allowing you to have a known environment all the way between the developers workstation through the testing environment(s) to production. There are several business values including 

- Improved productivity of dev, testing, and ops teams
- Reduced time-to-market by reducing configuration differences between environments
- Enhanced competitiveness - by getting features to your customers faster
- Simplified IT operations - just like VM's allowed to increase os densities on physical hardware, containers allow you to have increased application densities on the os.
- Improved reliability - the application is in an isolated container that is created by a script in source control, allowing repeat-ability and visibility to all involved 
- Reduced cost of the infrastructure - less vms = cheaper reducing operation expenses (always good!!)

Azure has a few options when it comes to Containers and deployment options. These have evolved quite a bit over the last year. Depending on your needs and workloads you can choose from having zero server involvement all the way up to full control of your infrastructure. My personal bias is that I do not like to have any involvement with IaaS or VM's in any which way. The reasons behind that bias is the maintenance needed for vm's including os patching, disk space maintenance, backups, and business continuity/Disaster recovery multi datacenter replications. All of those require a significant cost and time that I would rather put towards development for features and applications instead of operational costs. 

## Azure Container Services 
IaaS platform with the orchestration layer on top
You fire up several VM's with the required disks and then Azure provides the orchestration environment on top of that. Once everything is configured you are then responsible for the ongoing management of the VMs and the deployed orchestrator. This allows you to configure things exactly as you need them, you have a known version of the os and orchestrator (kubernetes, swarm, etc).

## Azure Container Instances 
this is the containers as a service(CaaS). 
You request a container instance to be created based on an image and the container is created for you. 
The orchestrator is abstracted away, no vm is seen, all you have is the container instance. 
Azure Container Instances are also billed per second which is geared towards the micro-service nature of containers than may be created and deleted in seconds. When creating a container instance you can select if it should be provisioned with a public IP address. The CaaS provides all of the scheduling and management capabilities required to run a single container while the orchestration handles multi-container tasks on top of it. The underlying infrastructure for container instances is managed automatically, allowing this ensures that it is always available. With CaaS this allows you to focus on the tasks that simplify the development of multi-container architectures, including scaling and coordinated upgrades.

## Web App for Containers
A relative new comer and by far my favorite option. This abstracts both the CaaS and IaaS. Traditionally we have been build and deploy .net apps to the app service in azure (Azure Web Apps). This allows you to define the scale up/down policies, the size of the underlying infrastructure, high availability, and automated deployments. Microsoft made it dead simple now to get a container created and deployed without any need for manual interventions. 

In your Build pipeline you: 

- do docker build 
- run docker test 
- create the container from the image
- push the image up to your container registry
- deploy out to your app service
    - this triggers a pull command for the app service to pull from the registry
    - I originally set this up i set the web app for container to continuous deployment and had the web app monitor the registry. This wasnt reliable though (YMMV - as this becomes more main stream the reliability may go up, so will have to revisit this later in ife)

    
# References:

- [https://www.itprotoday.com/microsoft-azure/azure-container-instances-and-azure-container-service](https://www.itprotoday.com/microsoft-azure/azure-container-instances-and-azure-container-service)
- [https://docs.microsoft.com/en-us/azure/container-instances/container-instances-orchestrator-relationship](https://docs.microsoft.com/en-us/azure/container-instances/container-instances-orchestrator-relationship)
- [https://docs.microsoft.com/en-us/azure/app-service/](https://docs.microsoft.com/en-us/azure/app-service/)