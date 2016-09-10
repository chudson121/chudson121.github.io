---
layout: post
title: code coverage why
tags: codecoverage
---

## Why should we care about code coverage and why that number. 
 
# Let's start with a story…. 
There was a data breach from a front facing application at company xyz.  
50,000 customer social security numbers, addresses, phone numbers were compromised and put on the internet for sale. A class action law suit covering 25,000 customers was brought against company xyz seeking 2 million in damages per customer affected (50,000,000,000 or 50 Billion dollars) 
 
During deposition all were disposed with the following questions: 
Are you a paid professional with all the pre-requisite skills to do your job? To which all the employees answered yes. 
What empirical evidence do you have that you did what you say you did to protect the customer? 
 
Here are the different answers to the second question: 

- Developer - I have check in history that I have coded to the specifications 
- Tester - I have a test case that’s manually executed covering the specifications 
- User acceptance tester -  I have a test case that’s manually executed covering specifications 
- Compliance - I have an audit report that all signoffs were obtained 
- Release engineer - I have the physical files that were deployed into production 
- Network/Sysadmin I have the firewall and system logs 
 
Out of these the objective evidence is: check in history, physical files deployed, system logs, and the audit. 
The testing here is subjective - what was tested, when was it tested, did anything change after the testing  that wasn’t seen are all subjective - the HOW it was tested is not easily repeatable.  
 
This is a process issue and automatic Unit, Integration, and Functional tests all provide empirical evidence that every change is tested and verified and the HOW it was tested is also documented with check in history. 
 
This doesn’t diminish the need for manual testing or UAT testing both provide additional safe guards but are coming from the users perspective rather than the underlying system. 
 
Code coverage at 80% is an initial value that Nathan presented as a target to get to, once our applications get to that level we should strive for a much higher number, it is an easy measurement since the number is system generated it is verifiable.  
 
Code coverage = Confidence Level to our business that the code developed was tested and agrees with the specifications.  
 
With the unit testing in place this allows us to develop quickly - (you know how those requirements are static right?), keep the code clean, and allows us to refactor with confidence that we are not creating any regression issues. 
 
 