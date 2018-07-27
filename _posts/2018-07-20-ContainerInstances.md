---
layout: post
title: "Container Instances"
description: "General Availability for Container Instances"
categories: Container Instances
author: "Chris Hudson"
meta: "CosmosDB, Docker "
---

# [Container Instances](https://azure.microsoft.com/en-us/services/container-instances/?WT.mc_id=azurebg_email_Trans_33771_1765_Release_MOSP_Tier2_July19)

I have been using the container instances for a couple of months now and so far I am in love with them. As many that know me I really have passion for PaaS offerings and prefer the to IaaS any day and twice on days ending in 'y'. Late last year I fired up several servers and using kubernetes stood up a little docker farm. And I hated it, there is a lot of overhead in doing this, the os patches, the kubernetes updates, figuring out the storage just a lot of pain. 

2 months ago I got word of the container instances and started poking around on those. I fell in love that day. Just like in many relationships sometimes the longer you go the more things you find out that aren't pretty.

I loved the fact that you could hook up the container instance directly to your docker registry and the CI should just work (back in the preview there were some problems - which we worked around with deploying to the instance directly). That was also a loving moment too though VSTS has build steps to deploy a docker container very easily!

# A few other fun things was 
- exposing environment variables in the instance so that the docker container could leverage them.
-  ssl wasnt too difficult as the instance is just like the web app instances
-  scaling up and down policies same as the web app instances so very easy if you are familiar (or better configuring using the arm templates and/or api calls).