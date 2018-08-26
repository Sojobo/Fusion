<cfif not IsDefined("url.model")>
    <cfset url.model = "mst" />
</cfif>

<cfquery name="carSales" datasource="FiveM">
  SELECT
    *
  FROM
    marketplace_vehicles
  INNER JOIN user_character_vehicles ON marketplace_vehicles.vplate = user_character_vehicles.vehicle_plate
  INNER JOIN user_character_vehicle_mods ON marketplace_vehicles.vplate = user_character_vehicle_mods.plate
  WHERE
    vehicle_model = <cfqueryparam value="#url.model#" CFSQLType="cf_sql_varchar" null="#NOT len(trim(url.model))#">
  AND sold = 1
  AND price > 100
  ORDER BY
    marketplace_vehicles.vid ASC
</cfquery>

<cfquery name="carRegistrations" datasource="FiveM">
  SELECT
    user_character_vehicles.vehicle_name,
    user_character_vehicles.vehicle_plate,
    user_characters.`name`
  FROM
    user_character_vehicles
  INNER JOIN user_characters ON user_character_vehicles.character_id = user_characters.id
  INNER JOIN users ON user_character_vehicles.character_id = user_characters.id
  WHERE
    vehicle_model = <cfqueryparam value="#url.model#" CFSQLType="cf_sql_varchar" null="#NOT len(trim(url.model))#">
  GROUP BY
    user_characters.id
</cfquery>

<cfset vehname = carRegistrations.vehicle_name />

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"><cfoutput>#vehname#</cfoutput></h1>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-bar-chart-o fa-fw"></i> Marketplace Sales
                </div>
                <div class="panel-body">
                    <canvas id="carMarketSales"></canvas>
                </div>
            </div>

        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Registration Information
                </div>
                <div class="panel-body">
                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-searchVehicles">
                      <thead>
                        <tr>
                          <th>Vehicle</th>
                          <th>Owner</th>
                          <th>Plate</th>
                        </tr>
                      </thead>
                      <tfoot>
                        <tr>
                          <th>Vehicle</th>
                          <th>Owner</th>
                          <th>Plate</th>
                        </tr>
                      </tfoot>
                      <tbody>
                        <cfoutput query="carRegistrations">
                          <tr>
                            <td>#vehicle_name#</td>
                            <td>#name#</td>
                            <td>#vehicle_plate#</td>
                          </tr>
                        </cfoutput>
                      </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    
</div>