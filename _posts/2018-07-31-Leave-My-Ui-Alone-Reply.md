--- 
layout: post 
title: "Leave My Ui Alone Reply" 
description: "reply to the post by John Rauser" 
categories:  devops, continuous integration
author: "Chris Hudson" 
meta: "" 
--- 

# CD vs UI changes
In John Rauser's article [Hey! DevOps! Leave my UI alone!](https://hackernoon.com/hey-devops-leave-my-ui-alone-9a6994a2f655) he presents that continuous delivery of the UI is harmful to our customers. In his words "But when it comes to business tools, abrupt and unexpected changes to the user interface are almost universally detested. UI/UX needs to be consistent. Changes should to be announced. Users need to be prepared."

Recently, Microsoft's [Visual Studio Team Services (VSTS)](https://visualstudio.microsoft.com/team-services/) made a major change to their user interface as well. The changed their menu system from a top view to side navigation and made significant changes to the build and release displays. Even though I was part of the preview group the changes were more vast than the preview even eluded too, and the frustrations that John's article emphasizes and I agree with.

I want to focus on a couple of points of disagreement I have with this. The primary thing that got me thinking today is code should be moved into production as soon as possible **BUT**, code should also be separated from "customer enabled". Code should always be flowing and it should be toggled off (to start with), toggled internal only (production testing, smoke testing), or toggled so that early adopters can see the new feature.

Big changes are not desirable, small incremental changes allows for adaptation of the users and modification of the feature based on feedback. If you have a preview toggle and the ability to go back to the old way and then measure how many times did people select to go back to the "old way" prior to releasing to the entire customer base, and soliciting feedback from your customers is a good way of measuring how customers will react.  

If product owners and delivery teams have direct access and communication to customers then changes should not be a surprise to anyone. The request for change or need of the new feature added should come from your customer base. The path to widespread use should also follow a continuous process: including demo's, perhaps blog entries about the new features (both from technical and business value directions), release notes, release communications, these are all things that should be part of a "Release" and should be separate from the code deployment into the production environment.  



#References:
John Rauser Article: Hey! DevOps! Leave my UI alone! [https://hackernoon.com/hey-devops-leave-my-ui-alone-9a6994a2f655](https://hackernoon.com/hey-devops-leave-my-ui-alone-9a6994a2f655)

Martin Fowler Article: Feature Toggles (aka Feature Flags) [https://martinfowler.com/articles/feature-toggles.html](https://martinfowler.com/articles/feature-toggles.html)