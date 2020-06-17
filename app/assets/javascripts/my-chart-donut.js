function loadDonutChart(object_id, sex, females, males){
  var number_of_female = [];
  var number_of_male = [];

  females.forEach(function(amount){
    number_of_female.push(amount)
  })
  males.forEach(function(amount){
    number_of_male.push(amount)
  })

  let total_of_female = number_of_female.reduce(addNumber);
  let total_of_male = number_of_male.reduce(addNumber);

  var ctx = document.getElementById(object_id);
  var myChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
      labels: sex,
      datasets: [{
        data: [total_of_female, total_of_male],
        backgroundColor: [
          'rgba(194, 10, 120, 0.7)',
          'rgba(10, 56, 194, 0.7)'
        ],
        borderColor: [
          'rgba(234, 236, 244, 1)',
          'rgba(234, 236, 244, 1)'
        ],
        borderWidth: 1
      }]
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
      },
      title: {
        display: true,
        text: setTitle(total_of_female + total_of_male)
      },
      cutoutPercentage: 50,
    },
  });
  myChart.canvas.parentNode.style.height = '530px';
  myChart.canvas.parentNode.style.width = '100%';
};