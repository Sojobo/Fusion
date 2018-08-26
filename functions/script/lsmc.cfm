<cfif IsDefined("getStats")>
  <script>
      // Set new default font family and font color to mimic Bootstrap's default styling
      Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
      Chart.defaults.global.defaultFontColor = '#292b2c';

      var ctx = document.getElementById("medicActivity");
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
            data: [<cfoutput query="getStats">#calls_medic#,</cfoutput>],
          },
          {
            label: "Patients Healed",
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
            data: [<cfoutput query="getStats">#medic_heals#,</cfoutput>],
          },
          {
            label: "Patients Saved",
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
            data: [<cfoutput query="getStats">#medic_revives#,</cfoutput>],
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
        $('#dataTables-getMedics').DataTable({
            responsive: true
        });
      });
  </script>
</cfif>