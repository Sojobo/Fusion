<!-- Protect from XSS attacks -->
<cfapplication
	name = "Fusion" 
	scriptprotect = "all" />

<cflogin> 
	<cfif isDefined("form.email")>logging in.. 
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