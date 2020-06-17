function loadPieChart(object_id, kelompoks_each_desa, desa_abrs){
  var number_of_kelompok = [];

  kelompoks_each_desa.forEach(function(amount){
    number_of_kelompok.push(amount)
  })

  let total_of_kelompok = number_of_kelompok.reduce(addNumber);

  // Pie Chart
  var ctx = document.getElementById(object_id);
  var myPieChart = new Chart(ctx, {
    type: 'polarArea',
    data: {
      labels: desa_abrs,
      datasets: [{
        data: kelompoks_each_desa,
        backgroundColor: ['rgba(255, 10, 10, 0.7)', 'rgba(104, 255, 10, 0.7)', 'rgba(255, 210, 10, 0.7)', 'rgba(10, 116, 255, 0.7)', 'rgba(10, 255, 153, 0.7)', 'rgba(226, 105, 194, 0.7)'],
        hoverBackgroundColor: ['rgba(255, 10, 10, 1)', 'rgba(104, 255, 10, 1)', 'rgba(255, 210, 10, 1)', 'rgba(10, 116, 255, 1)', 'rgba(10, 255, 153, 1)', 'rgba(226, 105, 194, 1)'],
        hoverBorderColor: "rgba(234, 236, 244, 1)"
      }],
    },
    options: {
      maintainAspectRatio: false,
      tooltips: {
        backgroundColor: "rgb(255,255,255)",
        bodyFontColor: "#858796",
        borderColor: '#dddfeb',
        borderWidth: 1,
        xPadding: 15,
        yPadding: 15,
        displayColors: false,
        caretPadding: 10,
      },
      legend: {
        display: true,
        labels: {
          usePointStyle: true
        }
      }
    }
  });
};

function loadPieChartSex(object_id, labels, list_of_values){
  var ctx = document.getElementById(object_id);
  var myPieChart = new Chart(ctx, {
    type: 'polarArea',
    data: {
      labels: labels,
      datasets: [{
        data: list_of_values,
        backgroundColor: ['rgba(194, 10, 120, 0.7)', 'rgba(10, 56, 194, 0.7)'],
        hoverBackgroundColor: ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)'],
        hoverBorderColor: "rgba(234, 236, 244, 1)",
      }],
    },
    options: {
      maintainAspectRatio: false,
      tooltips: {
        backgroundColor: "rgb(255,255,255)",
        bodyFontColor: "#858796",
        borderColor: '#dddfeb',
        borderWidth: 1,
        xPadding: 15,
        yPadding: 15,
        displayColors: false,
        caretPadding: 10,
      },
      legend: {
        display: false
      }
    }
  });
};