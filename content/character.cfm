<cfquery name="getCharacter" datasource="FiveM">
    SELECT *
    FROM user_characters
    WHERE id = 7176
</cfquery>

<cfquery name="getWarnings" datasource="FiveM">
    SELECT *
    FROM warnings
    WHERE user_identifier = "#getCharacter.identifier#"
    ORDER BY id DESC
</cfquery>

<cfquery name="getBans" datasource="FiveM">
    SELECT *
    FROM bans
    WHERE banned = "#getCharacter.identifier#"
    ORDER BY id DESC
</cfquery>

<cfquery name="getWeapons" datasource="FiveM">
    SELECT *
    FROM weapons
    WHERE (player = 7176 OR owner = "#getCharacter.identifier#")
    AND storage >= 0
    ORDER BY wid DESC
</cfquery>

<cfquery name="getTransactions" datasource="FiveM">
    SELECT *
    FROM user_character_transactions
    JOIN transaction_types ON user_character_transactions.type = transaction_types.id
    WHERE user_character_transactions.id = 7176
    ORDER BY tid DESC
    LIMIT 10
</cfquery>

<cfquery name="getMessages" datasource="FiveM">
    SELECT *, u1.`name` AS recipient, u2.`name` AS sender
    FROM user_character_messages
    JOIN user_characters u1 ON user_character_messages.`to` = u1.id
    JOIN user_characters u2 ON user_character_messages.`from` = u2.id
    WHERE `to` = 7176
    OR `from` = 7176
    ORDER BY user_character_messages.id DESC
    LIMIT 10
</cfquery>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"><cfoutput>#getCharacter.name#</cfoutput></h1>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-info fa-fw"></i> General Info
                </div>
                <div class="panel-body">
                    <cfoutput query="getCharacter">
                        <strong>Identifier</strong>
                        <p>#identifier#</p>
                        
                        <strong>Last IP</strong>
                        <p>--</p>

                        <strong>Licence</strong>
                        <p>--</p>

                        <strong>Role</strong>
                        <p>--</p>

                        <strong>Last Seen</strong>
                        <p>
                            <time class="timeago" datetime="#replace(left(lastonline, 19), " ", "T")#Z"></time> on Server #lastserver#
                        </p>

                        <strong>Money in Hand</strong>
                        <p>$#money#</p>

                        <strong>Money in Bank</strong>
                        <p>$#bankbalance#</p>

                        <strong>Play Time (hours)</strong>
                        <p>#playtime/60#</p>

                        <strong>Shots Fired</strong>
                        <p>#shotsfired#</p>

                        <strong>Distance Driven</strong>
                        <p>#kmdriven#</p>
                    </cfoutput>
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-exclamation-triangle fa-fw"></i> Warnings
                </div>
                <div class="panel-body">
                    <cfoutput query="getWarnings">
                        <strong>#reason#</strong>
                        <p>
                            <time class="timeago" datetime="#replace(left(timestamp, 19), " ", "T")#Z"></time>
                        </p>
                    </cfoutput>
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-gavel fa-fw"></i> Bans
                </div>
                <div class="panel-body">
                    <cfoutput query="getBans">
                        <strong>#reason#</strong>
                        <p>
                            <time class="timeago" datetime="#replace(left(timestamp, 19), " ", "T")#Z"></time>
                        </p>
                    </cfoutput>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-bullseye fa-fw"></i> Weapons
                </div>
                <div class="panel-body">
                    <cfoutput query="getWeapons">
                        <strong>#weapon#</strong>
                        <p>
                            Location: #storage#
                        </p>
                    </cfoutput>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-comments fa-fw"></i> Messages
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <ul class="timeline">
                        <cfoutput query="getMessages">
                            <cfset sClass = "" />
                            <cfset rClass = "" />
                            <cfif from eq 7176><cfset sClass = "timeline-inverted" /></cfif>
                            <cfif recipientRead eq 1><cfset rClass = "info" /></cfif>
                            <cfif deleted eq 1><cfset rClass = "danger" /></cfif>
                            <li class="#sClass#">
                                <div class="timeline-badge #rClass#"><i class="fa fa-mobile"></i>
                                </div>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4 class="timeline-title">#sender#</h4>
                                        <p><small class="text-muted"><i class="fa fa-clock-o"></i> <time class="timeago" datetime="#replace(left(when, 19), " ", "T")#Z"></time></small>
                                        </p>
                                    </div>
                                    <div class="timeline-body">
                                        <p>#body#</p>
                                    </div>
                                </div>
                            </li>
                        </cfoutput>
                    </ul>
                </div>
                <!-- /.panel-body -->
            </div>
        </div>

        <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-money fa-fw"></i> Transactions
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <ul class="timeline">
                        <cfoutput query="getTransactions">
                            <cfset sClass = "" />
                            <cfset rClass = "success" />
                            <cfif type gte 20><cfset sClass = "timeline-inverted" /><cfset rClass = "danger" /></cfif>
                            <li class="#sClass#">
                                <div class="timeline-badge #rClass#"><i class="fa fa-money"></i>
                                </div>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4 class="timeline-title">#description#</h4>
                                        <p><small class="text-muted"><i class="fa fa-clock-o"></i> <time class="timeago" datetime="#replace(left(timestamp, 19), " ", "T")#Z"></time></small>
                                        </p>
                                    </div>
                                    <div class="timeline-body">
                                        <p>#amount#</p>
                                    </div>
                                </div>
                            </li>
                        </cfoutput>
                    </ul>
                </div>
                <!-- /.panel-body -->
            </div>
        </div>

</div>