##Git Commands

#Gitting Older Versions
Use `git log` to find the revision you want to rollback to, and take note of the commit hash.
checkout to a new branch: `git checkout -b <new_branch_name> <hash>`

Example:
    
	$ git log
    
	commit 89915b4cc0810a9c9e67b3706a2850c58120cf75
    Author: Jardel Weyrich <suppressed>
    Date:   Wed Aug 18 20:15:01 2010 -0300
    Added a custom extension.
    
	commit 4553c1466c437bdd0b4e7bb35ed238cb5b39d7e7
    Author: Jardel Weyrich <suppressed>
    Date:   Wed Aug 18 20:13:48 2010 -0300
    Missing constness.
    
    $ git checkout -b revertedCodeBranch 4553c1466c437bdd0b4e7bb35ed238cb5b39d7e7
    HEAD is now at 4553c14... Missing constness.
    
#Return to Latest version
		git checkout master

#Revert commit - Non Destructive history
	git revert <hash>

