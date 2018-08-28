<!-- Protect from XSS attacks -->
<cfapplication
	name = "Fusion" 
	scriptprotect = "all" />

<cfscript>
	public string function getClientIp() {
	    local.response = "";

	    try {
	        try {
	            local.headers = getHttpRequestData().headers;
	            if (structKeyExists(local.headers, "X-Forwarded-For") && len(local.headers["X-Forwarded-For"]) > 0) {
	                local.response = trim(listFirst(local.headers["X-Forwarded-For"]));
	            }
	        } catch (any e) {}

	        if (len(local.response) == 0) {
	            if (structKeyExists(cgi, "remote_addr") && len(cgi.remote_addr) > 0) {
	                local.response = cgi.remote_addr;
	            } else if (structKeyExists(cgi, "remote_host") && len(cgi.remote_host) > 0) {
	                local.response = cgi.remote_host;
	            }
	        }
	    } catch (any e) {}

	    return local.response;
	}
</cfscript>

<cfoutput>#getClientIp()#</cfoutput>
<cflogin>
	<cfif isDefined("form.email")>logging in..
		<cfquery name="loginUser" datasource="FiveM">
			SELECT *
			FROM users
			WHERE username = "#form.email#"
			AND `group` = "#form.password#"
			LIMIT 1
		</cfquery>

		<cfquery name="loginUser" datasource="FiveM">
			SELECT *
			FROM users
			WHERE username = "#form.email#"
			AND `group` = "#form.password#"
			LIMIT 1
		</cfquery>

		<cfif loginUser.recordcount gt 0>logged in
			<cfloginuser name = "#form.email#" password = "#form.password#" roles = "user" >
		<cfelse>login failed
			<cfinclude template="login.cfm"> 
			<cfabort>
		</cfif>
	<cfelseif NOT IsDefined("cflogin")>not logged in
		<cfinclude template="login.cfm"> 
		<cfabort>
	<cfelse>logged in

	</cfif> 
</cflogin>

<cfif not IsUserLoggedIn() > 
	<cfinclude template="login.cfm"> 
	<cfabort> 
</cfif>