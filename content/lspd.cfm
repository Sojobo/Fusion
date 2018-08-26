<cfquery name="getStats" datasource="FiveM">
    SELECT *
    FROM (SELECT * FROM stats ORDER BY id DESC LIMIT 25) AS test 
    ORDER BY test.id ASC 
</cfquery>

<cfquery name="getPolice" datasource="FiveM">
    SELECT *, user_characters.`name`
    FROM police
    INNER JOIN user_characters ON police.identifier = user_characters.id
    ORDER BY rank DESC
</cfquery>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Los Santos Police Department</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-bar-chart-o fa-fw"></i> LSPD Activity
                </div>
                <div class="panel-body">
                    <canvas id="policeActivity"></canvas>
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