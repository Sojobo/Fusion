<cfquery name="getStats" datasource="FiveM">
    SELECT *
    FROM (SELECT * FROM stats ORDER BY id DESC LIMIT 25) AS test 
    ORDER BY test.id ASC 
</cfquery>

<cfquery name="getMedics" datasource="FiveM">
    SELECT *, user_characters.`name`
    FROM medic
    JOIN user_characters ON medic.identifier = user_characters.id
    ORDER BY rank DESC
</cfquery>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Los Santos Medical Department</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-bar-chart-o fa-fw"></i> LSMC Activity
                </div>
                <div class="panel-body">
                    <canvas id="medicActivity"></canvas>
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
                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-getMedics">
                      <thead>
                        <tr>
                          <th>Staff</th>
                          <th>Rank</th>
                          <th>Department</th>
                        </tr>
                      </thead>
                      <tfoot>
                        <tr>
                          <th>Staff</th>
                          <th>Rank</th>
                          <th>Department</th>
                        </tr>
                      </tfoot>
                      <tbody>
                        <cfoutput query="getMedics">
                          <tr>
                            <th>#name#</th>
                            <th>#rank#</th>
                            <th>#dept#</th>
                          </tr>
                        </cfoutput>
                      </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    
</div>