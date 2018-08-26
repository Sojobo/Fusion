<cfif IsDefined("form.searchterm")>
	<cfquery name="searchUsers" datasource="FiveM">
	    SELECT *
	    FROM user_characters
	    WHERE name LIKE "%#form.searchterm#%"
	</cfquery>

	<cfquery name="searchVehicles" datasource="FiveM">
	    SELECT *
	    FROM user_character_vehicles
	    WHERE vehicle_name LIKE "%#form.searchterm#%"
	    OR vehicle_plate LIKE "%#form.searchterm#%"
	</cfquery>
</cfif>