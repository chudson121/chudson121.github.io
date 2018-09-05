--- 
layout: post 
title: "User Stories and other VSTS work items" 
description: "Devops definintion and culture of Devops" 
categories:  Devops
author: "Chris Hudson" 
meta: "" 
--- 

# Example Project:
The business would like to engage their customers allowing the customers to give their feedback on new additions to a website. 

- Epic: User Feedback mechanisms
- Feature: Allow users to comment on articles.
- User story: As a user I want my comments saved so that they will be displayed to other users
- User story: As a user I want to filter comments for rude words so that I don't see naughty words
- User story: As a user I want to limit comments to 400 characters so that comments are consumed quickly
- User story: As a user I want to add captchas so that bots stop spamming the site.
- User story: As a user I want to log in with alternate credentials so that I can use Google id

![Work Item decomped](/Files/blog/WorkItemFlow.png)

# User stories 
User stories are requirements driven directly by a users needs and wants. The “User” is generally represented by a persona or a role. 
The “Feature” is something the user needs to be effective in their role or because of their persona. 
Lastly, the “Reason” is the answer to why the user needs the feature. If you can’t think of a good reason then maybe that user doesn’t really need that feature.

A user story is basically a use case in the preferred format 
# As a [User], I want [Feature], So that [Reason]

- What do your users need the software to actually do? 
- A story should be a unit of work that a team commits to in a sprint. 
Whether or not that unit requires subtasks should be up to the team.
- User Story is only meant to describe a feature, but not describe how to implement it, 
meaning leaving out the technical aspect, it should describe the behavior or flow from user’s perspective.
- Decomposition aims for closed story ending with the achievement of a meaningful goal.
Ex. As a user I want to reprint previous orders so that I don’t have to call customer service
Keep ui elements until later sprint when stories shift from being new functionality to being modification of existing functionality.
	Ex. A user can select dates from a date widget on the search screen

Describe the specific scene – the hero punches the criminal who fly's across the room, stopping the crime.
![GreenHornet User Story 1](/Files/blog/UserStoryGreenHornet1.jpg) ![GreenHornet User Story 2](/Files/blog/UserStoryGreenHornet2.jpg)


![Example User Story](/Files/blog/UserStoryAcctMgr.png) ![Example User Story - Bad guy](UserStoryMaliciousHacker.png)

# Acceptance Criteria 
- Part of the user story describing the Scenarios describe the flow through the system. They determine the input, actions taken, and output that is required for a feature to be accepted. Scenarios are where the rubber hits the road. If the scenarios are successful then QA should have no reason to reject the work that has been done. All “Happy” and “Sad” paths that have been considered should be added to a user story as scenarios. 

# Given [Preconditions], When [Action], Then [Expected Result] (GWT)
- **Given** the shopping cart is visible and has items in it **When** the user clicks the items trash icon 
**Then** the item should disappear from the list **and** a notification should be shown with the items name and an undo link.

# Example
![Given When Then Example](/Files/blog/UserStoryGWT.png)

## Decomposition
- how do we know the system is doing what we want, how do we measure it?
- Business rule variations
- Major efforts
Simple/complex
Variations in data
Data methods
Breaking out a spike
