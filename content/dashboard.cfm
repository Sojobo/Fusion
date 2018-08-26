<cfquery name="getStats" datasource="FiveM">
    SELECT *
    FROM (SELECT * FROM stats ORDER BY id DESC LIMIT 25) AS test 
    ORDER BY test.id ASC 
</cfquery>

<cfquery name="getBans" datasource="FiveM">
    SELECT bans.*, user_characters.`name`
    FROM bans
    INNER JOIN users ON bans.banned = users.identifier
    INNER JOIN user_characters ON bans.banned = user_characters.identifier
    WHERE banned like "steam:%"
    ORDER BY id DESC
    LIMIT 10
</cfquery>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Dashboard</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8">
            
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-bar-chart-o fa-fw"></i> Online Users
                </div>
                <div class="panel-body">
                    <canvas id="onlineUserHistory"></canvas>
                </div>
            </div>

        </div>

        <div class="col-lg-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-bell fa-fw"></i> Notifications
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <cfoutput query="getBans">
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
</div>