<cfif IsDefined("getStats")>
  <script>
      // Set new default font family and font color to mimic Bootstrap's default styling
      Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
      Chart.defaults.global.defaultFontColor = '#292b2c';

      var ctx = document.getElementById("policeActivity");
      var myLineChart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: [<cfoutput query="getStats">"#left(right(datetime, 10), 5)#",</cfoutput>],
          datasets: [{
            label: "911 Calls",
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
            data: [<cfoutput query="getStats">#calls_police#,</cfoutput>],
          },
          {
            label: "Arrests",
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
            data: [<cfoutput query="getStats">#police_arrests#,</cfoutput>],
          },
          {
            label: "Fines",
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
            data: [<cfoutput query="getStats">#police_fines#,</cfoutput>],
          },
          {
            label: "Store Robberies",
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
            data: [<cfoutput query="getStats">#robberies_stores#,</cfoutput>],
          },
          {
            label: "Bank Robberies",
            lineTension: 0.3,
            backgroundColor: "rgba(217,0,0,0.2)",
            borderColor: "rgba(217,0,0,1)",
            pointRadius: 5,
            pointBackgroundColor: "rgba(217,0,0,1)",
            pointBorderColor: "rgba(255,255,255,0.8)",
            pointHoverRadius: 5,
            pointHoverBackgroundColor: "rgba(217,0,0,1)",
            pointHitRadius: 50,
            pointBorderWidth: 2,
            data: [<cfoutput query="getStats">#robberies_banks#,</cfoutput>],
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

      jQuery(document).ready(function() {
        $('#dataTables-getPolice').DataTable({
            responsive: true
        });
      });
  </script>
</cfif>