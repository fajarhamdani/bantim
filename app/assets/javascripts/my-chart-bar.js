// function loadBarChart(area_names, person_each_area, number_of_people){
//   var ctx = document.getElementById('myChart');
//   var myChart = new Chart(ctx, {
//     type: 'bar',
//     data: {
//       labels: area_names,
//       datasets: [{
//         label: '# Jiwa',
//         data: person_each_area,
//         backgroundColor: [
//           'rgba(255, 99, 132, 0.2)',
//           'rgba(54, 162, 235, 0.2)',
//           'rgba(255, 206, 86, 0.2)',
//           'rgba(75, 192, 192, 0.2)',
//           'rgba(153, 102, 255, 0.2)',
//           'rgba(255, 159, 64, 0.2)',
//           'rgba(255, 0, 160, 0.3)',
//           'rgba(192, 192, 192, 0.3)',
//           'rgba(255, 200, 20, 0.3)',
//           'rgba(80, 200, 250, 0.3)'
//         ],
//         borderColor: [
//           'rgba(255, 99, 132, 1)',
//           'rgba(54, 162, 235, 1)',
//           'rgba(255, 206, 86, 1)',
//           'rgba(75, 192, 192, 1)',
//           'rgba(153, 102, 255, 1)',
//           'rgba(255, 159, 64, 1)',
//           'rgba(255, 0, 160, 1)',
//           'rgba(192, 192, 192, 1)',
//           'rgba(255, 200, 20, 1)',
//           'rgba(80, 200, 250, 1)'
//         ],
//         borderWidth: 1
//       }]
//     },
//     options: {
//       scales: {
//         yAxes: [{
//           ticks: {
//             beginAtZero: true
//           }
//         }]
//       },
//       legend: {
//         display: false
//       },
//       tooltips: false,
//       maintainAspectRatio: false,
//       title: {
//         display: true,
//         text: 'Total ' + thousands_separators(number_of_people) + ' Jiwa',
//         padding: 30
//       },
//       hover: {
//         animationDuration: 0
//       },
//       animation: {
//         duration: 1,
//         onComplete: function() {
//           var chartInstance = this.chart
//           ctx = chartInstance.ctx;
//           ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
//           ctx.fillStyle = this.chart.config.options.defaultFontColor;
//           ctx.textAlign = 'left';
//           ctx.textBaseline = 'bottom';

//           this.data.datasets.forEach(function(dataset, i) {
//             var meta = chartInstance.controller.getDatasetMeta(i);
//             meta.data.forEach(function(bar, index) {
//                   var data = dataset.data[index];
//                   ctx.fillText(data, bar._model.x, bar._model.y - 5);
//             });
//           });
//         }
//       }
//     }
//   });
//   myChart.canvas.parentNode.style.height = '430px';
//   myChart.canvas.parentNode.style.width = '100%';
// };

function loadMultipleDatasetChart(object_id, area_names, female_each_area, male_each_area, number_of_people){
  var ctx = document.getElementById(object_id);
  var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: area_names,
      datasets: [{
        label: ' Laki-laki',
        data: male_each_area,
        backgroundColor: [
          'rgba(54, 162, 235, 0.6)',
          'rgba(54, 162, 235, 0.6)',
          'rgba(54, 162, 235, 0.6)',
          'rgba(54, 162, 235, 0.6)',
          'rgba(54, 162, 235, 0.6)',
          'rgba(54, 162, 235, 0.6)',
          'rgba(54, 162, 235, 0.6)',
          'rgba(54, 162, 235, 0.6)',
          'rgba(54, 162, 235, 0.6)'
        ],
        borderColor: [
          'rgba(255, 99, 132, 1)',
          'rgba(255, 99, 132, 1)',
          'rgba(255, 99, 132, 1)',
          'rgba(255, 99, 132, 1)',
          'rgba(255, 99, 132, 1)',
          'rgba(255, 99, 132, 1)',
          'rgba(255, 99, 132, 1)',
          'rgba(255, 99, 132, 1)',
          'rgba(255, 99, 132, 1)'
        ],
        borderWidth: 1
      },{
        label: ' Wanita',
        data: female_each_area,
        backgroundColor: [
          'rgba(255, 99, 132, 0.6)',
          'rgba(255, 99, 132, 0.6)',
          'rgba(255, 99, 132, 0.6)',
          'rgba(255, 99, 132, 0.6)',
          'rgba(255, 99, 132, 0.6)',
          'rgba(255, 99, 132, 0.6)',
          'rgba(255, 99, 132, 0.6)',
          'rgba(255, 99, 132, 0.6)'
        ],
        borderColor: [
          'rgba(54, 162, 235, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(54, 162, 235, 1)'
        ],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      },
      legend: {
        display: true
      },
      tooltips: true,
      maintainAspectRatio: false,
      title: {
        display: true,
        text: setTitle(number_of_people),
        padding: 10
      },
      hover: {
        animationDuration: 0
      },
      animation: {
        duration: 1,
        onComplete: function() {
          var chartInstance = this.chart
          ctx = chartInstance.ctx;
          ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
          ctx.fillStyle = this.chart.config.options.defaultFontColor;
          ctx.textAlign = 'left';
          ctx.textBaseline = 'bottom';

          this.data.datasets.forEach(function(dataset, i) {
            var meta = chartInstance.controller.getDatasetMeta(i);
            meta.data.forEach(function(bar, index) {
                  var data = dataset.data[index];
                  ctx.fillText(data, bar._model.x, bar._model.y - 5);
            });
          });
        }
      }
    }
  });
  myChart.canvas.parentNode.style.height = '450px';
  myChart.canvas.parentNode.style.width = '100%';
};