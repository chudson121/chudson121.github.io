#How do I clone a repo
##Website Navigation - 
Example on cloning a GIT repo in Visual Studio
		
	- https://<tfsserver>/tfs/DefaultCollection/_git/<RepoName> 
	- click the clone button on the right hand side
	- click the clone in Visual studio button
	- in VS you click the clone button (verify the path you want the source code to download to)
	- you should see the solution file in the home part of team explorer inside VS
 
		
##From Within Visual studio

	- Click on Team Explorer Tab, Select Home
	if git server is already mapped  
	- Click the Manage Connections (green plug icon next to home) 
	- You should see list of all the repos
	- Right click on the repo select clone
	- in VS you click the clone button (verify the path you want the source code to download to)
	- you should see the solution file in the home part of team explorer inside VS
	- Double click it

#How do I update my local Git repositories with the latest changes made?

	- Update your master repo
	- double click on the local repo
	- click branches
	- right click on master 
	- click pull
 
Merge into your local branch

	- Right click on the branch
	- Click merge from
	- Merge From Branch: Choose Master
	- Into current branch: your local repo
	- Resolve conflicts…. If any

#How to I resolve the missing references in my project?
	
	- Right click on the solution (not the project but solution itself)
	- Click restore nuget packages.
