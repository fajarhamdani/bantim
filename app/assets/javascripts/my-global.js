function thousands_separators(num){
  var num_parts = num.toString().split(".");
  num_parts[0] = num_parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  return num_parts.join(".");
};

function setTitle(list_of_number){
  let total_number_of_people = thousands_separators(list_of_number)

  return ('Total ' + total_number_of_people + ' Jiwa')
}

function addNumber(total, num) {
  return total + num;
}