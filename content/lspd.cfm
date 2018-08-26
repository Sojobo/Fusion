<cfquery name="getStats" datasource="FiveM">
    SELECT *
    FROM (SELECT * FROM stats ORDER BY id DESC LIMIT 25) AS test 
    ORDER BY test.id ASC 
</cfquery>

<cfquery name="getPolice" datasource="FiveM">
    SELECT *, user_characters.`name`
    FROM police
    JOIN user_characters ON police.identifier = user_characters.id
    ORDER BY rank DESC
</cfquery>

<cfquery name="getArrests" datasource="FiveM">
    SELECT *, user_characters.`name`
    FROM logs_arrests
    JOIN user_characters ON logs_arrests.suspect = user_characters.id
    ORDER BY aid DESC
    LIMIT 10
</cfquery>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Los Santos Police Department</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-bar-chart-o fa-fw"></i> LSPD Activity
                </div>
                <div class="panel-body">
                    <canvas id="policeActivity"></canvas>
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-bell fa-fw"></i> Arrests
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <cfoutput query="getArrests">
                            <a href="" class="list-group-item">
                                <i class="fa fa-gavel fa-fw"></i> #name#
                                <span class="pull-right text-muted small">
                                    <em>
                                        <time class="timeago" datetime="#replace(left(timestamp, 19), " ", "T")#Z"></time>
                                    </em>
                                </span>
                            </a>
                        </cfoutput>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Officers
                </div>
                <div class="panel-body">
                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-getPolice">
                      <thead>
                        <tr>
                          <th>Officer</th>
                          <th>Rank</th>
                          <th>Department</th>
                          <th>SWAT</th>
                          <th>Air</th>
                          <th>Boat</th>
                        </tr>
                      </thead>
                      <tfoot>
                        <tr>
                          <th>Officer</th>
                          <th>Rank</th>
                          <th>Department</th>
                          <th>SWAT</th>
                          <th>Air</th>
                          <th>Boat</th>
                        </tr>
                      </tfoot>
                      <tbody>
                        <cfoutput query="getPolice">
                          <tr>
                            <th>#name#</th>
                            <th>#rank#</th>
                            <th>#dept#</th>
                            <th>#cert_swat#</th>
                            <th>#cert_air#</th>
                            <th>#cert_boat#</th>
                          </tr>
                        </cfoutput>
                      </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    
</div>