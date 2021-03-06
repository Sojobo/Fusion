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

<cflogin idletimeout="43200" allowconcurrent="false">
	<cfif isDefined("form.email")><!-- login attempt.. -->
		<cfquery name="fusionUser" datasource="FiveM">
			SELECT *
			FROM fusion_users
			WHERE fuser = <cfqueryparam value="#form.email#" CFSQLType="cf_sql_varchar">
			LIMIT 1
		</cfquery>
		
		<cfif fusionUser.recordcount gt 0><!-- Fusion user exists -->
			<cfif hash(form.password, "SHA-256", "UTF-8") is fusionUser.fpass>
				<cfquery name="strpUser" datasource="FiveM">
					SELECT *
					FROM users
					WHERE identifier = "#fusionUser.suid#"
					LIMIT 1
				</cfquery>
			<cfelse>
				fail-pass
				<cfabort>
			</cfif>
		<cfelse><!-- No fusion user, trying manual -->
			<cfquery name="forumUser" datasource="Forums">
				SELECT *
				FROM core_members_known_ip_addresses
				JOIN core_members ON core_members_known_ip_addresses.member_id = core_members.member_id
				WHERE core_members_known_ip_addresses.ip_address = "#getClientIp()#"
				AND core_members.email = <cfqueryparam value="#form.email#" CFSQLType="cf_sql_varchar">
				ORDER BY last_seen DESC
				LIMIT 1
			</cfquery>

			<cfquery name="strpUser" datasource="FiveM">
				SELECT *
				FROM users
				WHERE lastip = "#getClientIp()#"
				LIMIT 1
			</cfquery>

			<cfif strpUser.recordcount gt 0 AND forumUser.recordCount gt 0>
				<cfquery name="newFusionUser" datasource="FiveM">
					INSERT INTO fusion_users (fuser, fpass, suid)
					VALUES (<cfqueryparam value="#form.email#" CFSQLType="cf_sql_varchar">,
					<cfqueryparam value="#hash(form.password, "SHA-256", "UTF-8")#" CFSQLType="cf_sql_varchar">,
					<cfqueryparam value="#strpUser.identifier#" CFSQLType="cf_sql_varchar">)
				</cfquery>
			<cfelse>
				fail-account
				<cfabort>
			</cfif>
		</cfif>

		<cfif strpUser.recordcount gt 0><!-- logged in -->
			<cfset myRoles = "user" />

			<cfif not strpUser.group eq "user">
				<cfset myRoles = "#myRoles#,#strpUser.group#" />
			</cfif>
			<cfset session.steamid = #strpUser.identifier# />

			<cfquery name="getCharacters" datasource="FiveM">
			    SELECT id
			    FROM user_characters
			    WHERE identifier = "#session.steamid#"
			</cfquery>
			<cfset session.policeRank = 0 />
			<cfset session.medicRank = 0 />

			<cfoutput query="getCharacters">
				<cfquery name="getPoliceRank" datasource="FiveM">
				    SELECT rank
				    FROM police
				    WHERE identifier = "#id#"
				    ORDER BY rank DESC
				    LIMIT 1
				</cfquery>
				<cfif getPoliceRank.recordcount gt 0 and getPoliceRank.rank gt session.policeRank>
					<cfset session.policeRank = #getPoliceRank.rank# />
				</cfif>

				<cfquery name="getMedicRank" datasource="FiveM">
				    SELECT rank
				    FROM medic
				    WHERE identifier = "#id#"
				    ORDER BY rank DESC
				    LIMIT 1
				</cfquery>
				<cfif getMedicRank.recordcount gt 0 and getMedicRank.rank gt session.medicRank>
					<cfset session.medicRank = #getMedicRank.rank# />
				</cfif>
			</cfoutput>

			<cfif session.policeRank gt 0>
				<cfset myRoles = "#myRoles#,Police" />
			</cfif>
			<cfif session.medicRank gt 0>
				<cfset myRoles = "#myRoles#,Medic" />
			</cfif>

			<cfoutput><!-- #myRoles# --></cfoutput>
			<cfloginuser name = "#strpUser.username#" password = "#form.password#" roles = "#myRoles#" >
			 success
		<cfelse><!-- not found -->
			fail-game
		</cfif>
	<cfelse>
		fail-form
	</cfif> 
</cflogin>