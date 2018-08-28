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

<cflogin>
	<cfif isDefined("form.email")>
		<cfquery name="forumUser" datasource="Forums">
			SELECT *
			FROM core_members_known_ip_addresses
			JOIN core_members ON core_members_known_ip_addresses.member_id = core_members.member_id
			WHERE core_members_known_ip_addresses.ip_address = "#getClientIp()#"
			AND core_members.email = "#form.email#"
			ORDER BY last_seen DESC
			LIMIT 1
		</cfquery>

		<cfquery name="strpUser" datasource="FiveM">
			SELECT *
			FROM users
			WHERE lastip = "#getClientIp()#"
			LIMIT 1
		</cfquery>

		<cfif forumUser.recordcount gt 0 and strpUser.recordcount gt 0>logged in
			<cfloginuser name = "#form.email#" password = "#form.password#" roles = "user" >
		<cfelse>login failed
			<cfinclude template="login.cfm"> 
			<cfabort>
		</cfif>
	<cfelseif NOT IsDefined("cflogin")>
		<cfinclude template="login.cfm"> 
		<cfabort>
	<cfelse>

	</cfif> 
</cflogin>

<cfif not IsUserLoggedIn() > 
	<cfinclude template="login.cfm"> 
	<cfabort> 
</cfif>