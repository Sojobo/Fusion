<cfquery name="getAchievements" datasource="FiveM">
	SELECT *
	FROM achievements
    ORDER BY name ASC
</cfquery>

<cfquery name="getCharacters" datasource="FiveM">
    SELECT *
    FROM user_characters
    WHERE identifier = "#session.steamid#"
</cfquery>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header"><cfoutput>#GetAuthUser()#</cfoutput></h1>
		</div>
	</div>

    <div class="row">
        <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Characters
                </div>
                <div class="panel-body">
                    <div class="panel-group" id="accordion">
                        <cfoutput query="getCharacters">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="##accordion" href="##collapse#ReReplace(name, "[[:space:]]","","ALL")#">#name#</a>
                                    </h4>
                                </div>
                                <div id="collapse#ReReplace(name, "[[:space:]]","","ALL")#" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        Playtime: #playtime#
                                    </div>
                                </div>
                            </div>
                        </cfoutput>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Achievements
                </div>
                <div class="panel-body">
                    <cfoutput query="getAchievements">
                        <div class="row" style="padding-top:4px">
                            <div class="col-lg-3">
                                <img src="#image#" alt="#name#" />
                            </div>
                            <div class="col-lg-9">
                                <br />
                                <p>
                                    <strong>#name# #level#</strong>
                                    <span class="pull-right text-muted">0/#goal# #description#</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                        <span class="sr-only">0% Complete (danger)</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </cfoutput>
                </div>
            </div>
        </div>
    </div>

</div>