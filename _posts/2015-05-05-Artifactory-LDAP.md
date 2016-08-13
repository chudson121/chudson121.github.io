## Artifactory 
# LDAP
Add global group
Settings Name - friendly name to use
ldap settings - ads
mapping strategy use Dynamic

Get the full DN for group (i used dsquery from microsoft -  Remote Server Administration Tools for Windows® 7 with SP1)
dsquery group -name "GG-GROUPNAME"

use the results in the search base 
click refresh, then check mark the group, and then click import
sync state should have a check mark if successful

# LDAP Configuration
Info to do after we get a service account to read ldap
Needs to be an ads service account
Get the Common name

	dsquery user -samid <username> 
	something like this returns: "CN=<display name>,OU=<TOPLEVEL>,OU=<LEVEL1>,DC=<LEVEL2>,DC=<DOMAIN>,DC=com"

Put it in manager DN
add service account pw to manager password

# Encrypt the config
http://<SERVERNAME>:8081/artifactory/webapp/securitygeneralconfig.html
decrypt then encrypt
 


