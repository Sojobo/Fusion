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
		<div class="col-lg-12">
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
	</div>

</div>