//= require rails-ujs
//= require_tree .
function currentTime() {
var currentTime = new Date(),
    hours = currentTime.getHours(),
    minutes = currentTime.getMinutes();
    if (minutes < 10) {
     minutes = "0" + minutes;
    }
    return (hours + ":" + minutes);
}
function currentDate() {
  var currentDate = new Date(),
  day = currentDate.getDate(),
  month = currentDate.getMonth() + 1,
  year = currentDate.getFullYear();
  return (day + "/" + month + "/" + year);
}
