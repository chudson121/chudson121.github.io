# [Permissions on Services](http://serverfault.com/questions/166641/how-to-give-rights-to-one-user-for-the-restart-of-a-service)
		
		You can use the sc command to set permissions on a specific service.
		The format is a little difficult to understand, but first you will need to find the user or group's SID to use the command (something like "S-1-5-21-....").
		sc myserver sdset spooler D:(A;;RPWP;;;place-sid-here)

		A couple notes on that command:
			• RP Allows service start
			• WP Allows service stop
		Replace myserver with your server's name and spooler with the service you want to edit.
		More information is available at the following locations:
		http://technet.microsoft.com/en-us/library/cc742037(WS.10).aspx
		http://msmvps.com/blogs/erikr/archive/2007/09/26/set-permissions-on-a-specific-service-windows.aspx
		
		From <http://serverfault.com/questions/166641/how-to-give-rights-to-one-user-for-the-restart-of-a-service> 
