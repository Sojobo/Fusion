<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Search Results</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Characters
                </div>
                <div class="panel-body">
                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-searchUsers">
                        <thead>
                            <tr>
                                <th>Character name</th>
                                <th>Playtime</th>
                                <th>Online</th>
                                <th>Cash in Hand</th>
                                <th>Bank Balance</th>
                            </tr>
                        </thead>
                        <tbody>
                            <cfoutput query="searchUsers">
                                <cfif deleted eq 1><cfset class = "danger" /><cfelse><cfset class = "" /></cfif>
                                <tr class="#class#">
                                    <td>#name#</td>
                                    <td>#playtime#</td>
                                    <td>#currentserver#</td>
                                    <td>#money#</td>
                                    <td>#bankbalance#</td>
                                </tr>
                            </cfoutput>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Vehicles
                </div>
                <div class="panel-body">
                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-searchVehicles">
                        <thead>
                            <tr>
                                <th>Current Owner</th>
                                <th>Vehicle Model</th>
                                <th>Base Value</th>
                                <th>Number Plate</th>
                                <th>Location</th>
                                <th>Damage</th>
                            </tr>
                        </thead>
                        <tbody>
                            <cfoutput query="searchVehicles">
                                <tr>
                                    <td>#character_id#</td>
                                    <td>#vehicle_name#</td>
                                    <td>#vehicle_price#</td>
                                    <td>#vehicle_plate#</td>
                                    <td>#vehicle_state#</td>
                                    <td>#vehicle_damage#</td>
                                </tr>
                            </cfoutput>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>