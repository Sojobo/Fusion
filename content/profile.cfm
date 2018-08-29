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
                    <div class="row">
                        <div class="col-lg-3">
                            <img src="images/arrest_red.svg" alt="Achievement" />
                        </div>
                        <div class="col-lg-9">
                            <br />
                            <p>
                                <strong>Thug II</strong>
                                <span class="pull-right text-muted">12/50 people mugged</span>
                            </p>
                            <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="24" aria-valuemin="0" aria-valuemax="100" style="width: 24%">
                                    <span class="sr-only">24% Complete (danger)</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row" style="padding-top:4px">
                        <div class="col-lg-3">
                            <img src="images/convict.svg" alt="Achievement" />
                        </div>
                        <div class="col-lg-9">
                            <br />
                            <p>
                                <strong>Inmate I</strong>
                                <span class="pull-right text-muted">69/100 months served</span>
                            </p>
                            <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="69" aria-valuemin="0" aria-valuemax="100" style="width: 69%">
                                    <span class="sr-only">69% Complete (danger)</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row" style="padding-top:4px">
                        <div class="col-lg-3">
                            <img src="images/lock-picking.svg" alt="Achievement" />
                        </div>
                        <div class="col-lg-9">
                            <br />
                            <p>
                                <strong>Car Jacker I</strong>
                                <span class="pull-right text-muted">99/100 cars jacked</span>
                            </p>
                            <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="99" aria-valuemin="0" aria-valuemax="100" style="width: 99%">
                                    <span class="sr-only">99% Complete (danger)</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row" style="padding-top:4px">
                        <div class="col-lg-3">
                            <img src="images/police-car.svg" alt="Achievement" />
                        </div>
                        <div class="col-lg-9">
                            <br />
                            <p>
                                <strong>Hot Ride I</strong>
                                <span class="pull-right text-muted">1/5 APBs issued</span>
                            </p>
                            <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                    <span class="sr-only">20% Complete (danger)</span>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

</div>