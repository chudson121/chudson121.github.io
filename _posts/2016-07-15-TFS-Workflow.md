---
layout: post
title: Workflow
tags: tfs
---

In our continuous push to eliminate as much waste as we can so that we can deliver new features as fast as we can we simplified the process. Let me use ordering a cake for an example….

Product owner/stake holder/customer orders a cake, on the order we ask what type of cake, how big, does the cake have any other decorations, when do you want the cake to be done, when do you want it to be delivered (User story) 
  
We want to know how that the cake will look, taste, smell, feel does it meet the expectations of the order (Test Case/Acceptance Criteria) 
  
The ingredients, the sugar, flour, eggs etc. that's the (Source Code) 
After we combined all the ingredients and before we pour it into the baking pan we lick the spoon  
this is the (Pull Request) - first chance to see if it mixes well, has the look and feel of a cake. 
  
If it tastes good, we pour it into the pan and cook it (Build steps) 
  
After it cooks, then we do the toothpick test to ensure its done, we check the cake over to make sure it's not burnt 
this is our (Automated Testing) 

- unit tests - verify individual parts of the raw material are what we expect and behave the way we expect 
was the egg ok, was the milk not spoiled, did we use white sugar 
- functional tests - verify sub components work together as expected, did we fold the egg whites in correctly did the cake rise.

Then we put the cake on a plate and start serving it up (Deployment to test) 
We get to eat the cake first (QA/UAT/Perf/Load/etc) and make sure it meets up with the recipe and the order 
  
After we get our belly's full and the cake looks good, tastes good, and whoever wanted the cake in the first place says that it is what they want (product owners acceptance, stake holders approval)  
We box the cake up and deliver the cake (deployment transforms for production) 
Notify the customer we are going to deliver the cake to them and when. 
Once this cake is in the customers hands we can close the order (production deployment) 
Notify the customer the order is complete - its only nice to communicate 
  
# User Story  
New --> just got the order from the customer/product owner/stake holder, may not have all the info in it 
Active --> we are working on the cake 
Resolved --> Cake is on the way to be delivered - shouldn't be here unless all the tests are complete 
Closed --> customer has the cake and can eat it too. 
 
Who should change them? 
Devs should ONLY change the state of a user story from New to Active.  This signifies that work on the user story has begun. 
Only QA or product owner changes the state of a user story to Resolved.  This means all tasks & tests for the user story have been completed and it is ready to be deployed to production. 
Only DevOps changes the State of a user story to Closed when the code has been deployed to Production 
  
# Test Case - if you're not letting others taste the cake that's just rude! 
Design --> how are we going to know that this is good cake 
Ready --> going to eat some cake 
Closed --> hmmmm that was good cake; it can go to the customer 
 
Who should change them? 
Testers are the only ones changing state on the test cases. 
  
# Bug - oops someone forgot the frosting 
Todo - got to get the frosting on their, was anything else missed? 
Doing - adding the frosting as we speak 
Testing - check that the frosting is there, does it look good? 
Done - ok cake is ready for the customer again 
Completed - customer has the cake and can eat it too. 
 
Who should change them? 
Devs should ONLY change the state from todo to doing.  This signifies that work has begun, once completed notify the tester. 
Testers change the state from doing to Testing when development has completed their work 
Testers change the state to Done 
Devops changes the state to completed after it is deployed to production 
 
  
# Dev Responsibilities: 
When your coding tasks have been completed & the PR has been accepted, reach out to the QA person assigned to the test case(s) & let them know the code will be ready to test soon.  If no specific QA person is assigned to the test case, please notify Lorrie & Melissa that it will be ready to test as soon as Jenkins deploys it.   
Do not change the state of the user story to ‘Resolved’ when your coding task(s) are done. 
 
# Scrum Team process 
Product Owners own the user story, after the code is created, built, deployed, tested, and accepted (demo'ed working feature) move user story to Resolved 
Testers - Test Cases should be closed prior to demo of the feature 
Developers - ensure code was code reviewed, built, deployed, and tested 
  
# Non Scrum Team process 
Testers - hey this cake is good, close the test cases, ensure all other testing is complete and change the user story to Resolved 
Developers - ensure code was code reviewed, built, deployed, and tested; NOTIFY the testers that your cake is ready 
  
# Either scrum or non scrum 
Devops - coordinates prod deployments, deploys code to production, sends communication when complete, changes state of user story to Completed 
 
 
# Summary: 
All User Stories need to have at least 1 test case and it should be Complete before the user story is put into Resolved (this is the definition of done and signals that we should move it to production) 
 