<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ASE - All Seeing Eye</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

	<cfif IsDefined("url.fnc")>
		<cfinclude template="functions/#url.fnc#.cfm" />
	</cfif>
</head>

<body>
    <div id="wrapper">

    	<cfinclude template="modules/navigation.cfm" />

    	<cfif IsDefined("form.searchterm")>
    		<cfinclude template="content/search.cfm" />
    	<cfelse>
    		<cfinclude template="content/dashboard.cfm" />
    	</cfif>

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/timeago/jquery.timeago.js" type="text/javascript"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Charts.js JavaScript -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

<cfif IsDefined("getStats")>
<script>
    // Set new default font family and font color to mimic Bootstrap's default styling
    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#292b2c';

    var ctx = document.getElementById("onlineUserHistory");
    var myLineChart = new Chart(ctx, {
      type: 'line',
      data: {
        labels: [<cfoutput query="getStats">"#left(right(datetime, 10), 5)#",</cfoutput>],
        datasets: [{
          label: "Server 1",
          lineTension: 0.3,
          backgroundColor: "rgba(2,117,216,0.2)",
          borderColor: "rgba(2,117,216,1)",
          pointRadius: 5,
          pointBackgroundColor: "rgba(2,117,216,1)",
          pointBorderColor: "rgba(255,255,255,0.8)",
          pointHoverRadius: 5,
          pointHoverBackgroundColor: "rgba(2,117,216,1)",
          pointHitRadius: 50,
          pointBorderWidth: 2,
          data: [<cfoutput query="getStats">#s1PlayerCount#,</cfoutput>],
        },
        {
          label: "Server 2",
          lineTension: 0.3,
          backgroundColor: "rgba(2,117,2,0.2)",
          borderColor: "rgba(2,117,2,1)",
          pointRadius: 5,
          pointBackgroundColor: "rgba(2,117,2,1)",
          pointBorderColor: "rgba(255,255,255,0.8)",
          pointHoverRadius: 5,
          pointHoverBackgroundColor: "rgba(2,117,2,1)",
          pointHitRadius: 50,
          pointBorderWidth: 2,
          data: [<cfoutput query="getStats">#s2PlayerCount#,</cfoutput>],
        },
        {
          label: "Whitelist",
          lineTension: 0.3,
          backgroundColor: "rgba(117,117,216,0.2)",
          borderColor: "rgba(117,117,216,1)",
          pointRadius: 5,
          pointBackgroundColor: "rgba(117,117,216,1)",
          pointBorderColor: "rgba(255,255,255,0.8)",
          pointHoverRadius: 5,
          pointHoverBackgroundColor: "rgba(117,117,216,1)",
          pointHitRadius: 50,
          pointBorderWidth: 2,
          data: [<cfoutput query="getStats">#s5PlayerCount#,</cfoutput>],
        },
        {
          label: "Dev",
          lineTension: 0.3,
          backgroundColor: "rgba(216,117,0,0.2)",
          borderColor: "rgba(216,117,0,1)",
          pointRadius: 5,
          pointBackgroundColor: "rgba(216,117,0,1)",
          pointBorderColor: "rgba(255,255,255,0.8)",
          pointHoverRadius: 5,
          pointHoverBackgroundColor: "rgba(216,117,0,1)",
          pointHitRadius: 50,
          pointBorderWidth: 2,
          data: [<cfoutput query="getStats">#s123PlayerCount#,</cfoutput>],
        }],
      },
      options: {
        scales: {
          xAxes: [{
            time: {
              unit: 'date'
            },
            gridLines: {
              display: false
            },
            ticks: {
              maxTicksLimit: 24
            }
          }],
          yAxes: [{
            ticks: {
              min: 0,
              max: 32,
              maxTicksLimit: 10
            },
            gridLines: {
              color: "rgba(0, 0, 0, .125)",
            }
          }],
        },
        legend: {
          display: true
        }
      }
    });
</script>
</cfif>

<script>
	jQuery(document).ready(function() {
		jQuery("time.timeago").timeago();

        $('#dataTables-searchUsers').DataTable({
            responsive: true
        });

        $('#dataTables-searchVehicles').DataTable({
            responsive: true
        });
	});
</script>

</body>

</html>
