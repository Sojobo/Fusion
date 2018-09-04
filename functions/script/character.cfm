<cfif IsDefined("getTransactions")>
  <script>
      // Set new default font family and font color to mimic Bootstrap's default styling
      Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
      Chart.defaults.global.defaultFontColor = '#292b2c';

      var ctx = document.getElementById("transactionHistory");
      var myLineChart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: [<cfoutput query="getTransactions">"#left(right(timestamp, 10), 5)#",</cfoutput>],
          datasets: [{
            label: "Cash",
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
            data: [<cfoutput query="getTransactions">#handcash#,</cfoutput>],
          },
          {
            label: "Bank Balance",
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
            data: [<cfoutput query="getTransactions">#bankcash#,</cfoutput>],
          },],
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
  </script>
</cfif>