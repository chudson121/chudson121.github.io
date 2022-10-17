---
layout: post
title: Git Visual Studio Branches and Pull Requests
tags: git
---
## Flow
Master ==> UserStoryBranch ==> Local Dev ==> Commit changes ==>	
push UserStoryBranch ==> Pull Request ==> Master ==> Build ==> Deploy Test
	
## COMMAND LINE
1. Clone the repo `git clone   https://tfsserver/tfs/DefaultCollection/_git/[repository]`
2. Once cloned, create a new user story branch: `git checkout -b 2223`
3. When you have changes to add to the repo, stage the files using:`git add .`
4. Then commit to the local repo: (using #ID will auto link to work item) `git commit -am "#2223 Initial commit"`
5. When you're ready to publish your topic branch to the repo on VSTS, push the changes:`git push origin 2223`
6. Now you can return to the web portal to complete the pull request experience.

## Visual Studio
1. In Team Explorer, navigate to the Branches page. 

![]({{site.url}}/img/gitbranchpullreq/vsbranches1.png)

2. On the Branches page, right-click on the master branch and choose New Local Branch From... to create a new topic branch.

![]({{site.url}}/img/gitbranchpullreq/vsbranchesnewlocal.png)

3. Enter a name for your branch and click Create Branch. When naming your branches, use slashes to organize your branches. (You can use #<storyid> for user story branches - #123)

![]({{site.url}}/img/gitbranchpullreq/vsbranchescreate.png)	
	
Make a change to your app Now that you have a new topic branch, you're ready to start making changes to your app.
1. Add a "hello, world" message to the console app.

![]({{site.url}}/img/gitbranchpullreq/vshelloworld.png)
	
# Commit
1. Right-click on the file in Solution Explorer and choose Commit.

![]({{site.url}}/img/gitbranchpullreq/vscommit.png)

2. On the Changes page, enter a commit message and click Commit to commit the changes to your topic branch.

![]({{site.url}}/img/gitbranchpullreq/vschangescommit.png)
	
# Publish - to your REMOTE Branch (server)
To share the changes in your topic branch, you'll need to publish it to the server.
1. Click on the Sync link in the successful commit notification to open the Synchronization page.

![]({{site.url}}/img/gitbranchpullreq/vscommitsyncmessage.png)		

2. On the Sync page, click on the Publish link to push the changes on your topic branch to the server.

![]({{site.url}}/img/gitbranchpullreq/vssyncpublish.png)
	
# Create a pull request
Pull Requests are a common workflow for reviewing code created in a topic branch and merging changes. Let's create a pull request to see how it works.
1. In your browser, open the CODE hub and click Pull Requests to view the Pull Requests hub.

![]({{site.url}}/img/gitbranchpullreq/webpullrequesthub.png)		

2. Click on New Pull Request to create a new pull request.

![]({{site.url}}/img/gitbranchpullreq/webpullrequestnew.png)	

3. Select your topic branch from the first drop-down. The default branch (master) is the default target branch.

![]({{site.url}}/img/gitbranchpullreq/webpullrequestselectbranch.png)

4. Verify that the preview contains the changes you want to review and click Create Pull Request.

![]({{site.url}}/img/gitbranchpullreq/webpullrequestcreate.png)

Now you can add reviewers to get their feedback on your changes before you merge your changes into master.

![]({{site.url}}/img/gitbranchpullreq/webpullrequestinprogress.png)		

# Completing a pull request with a merge
When the review of the PR is complete and policies are passing, it’s time to merge. In the Complete Pull Request dialog, the default description for the merge commit will include a list of the work items associated with the pull request.  This is useful for anyone viewing the commit history in the future to know which work items are related, no matter what tool they’re using to view history.

![]({{site.url}}/img/gitbranchpullreq/complete-pull-request.png)

After the PR is merged, the related work items will be automatically linked to the merge commit.  The commit details view will show all of the linked work items.

[pull request](https://www.visualstudio.com/en-us/docs/git/get-started#conduct-a-pull-request)

[wi to git branches](https://blogs.msdn.microsoft.com/visualstudioalm/2016/03/02/linking-work-items-to-git-branches-commits-and-pull-requests) 



