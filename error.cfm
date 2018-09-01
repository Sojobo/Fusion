<cfset structClear( session ) />
<cflogout>
<cflocation url="index.cfm?view=error" addtoken="false" />