<cfapplication
	name = "Fusion" 
	scriptprotect = "all"
	sessionmanagement = "true"
	sessiontimeout = #CreateTimeSpan(0, 12, 0, 0)#
	loginStorage = "session" />