<script>
  // Set new default font family and font color to mimic Bootstrap's default styling
  Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
  Chart.defaults.global.defaultFontColor = '#292b2c';

  var ctx = document.getElementById("carMarketSales");
  var carLineChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: [<cfoutput query="carSales">"#right(left(listdate, 10), 5)#",</cfoutput>],
      datasets: [{
        label: "Sale Prices",
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
        data: [<cfoutput query="carSales">#price#,</cfoutput>],
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