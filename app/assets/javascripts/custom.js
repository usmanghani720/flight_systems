$("body").on("click", "[data-radioactive]", function(e) {
  $(this).parents('.radio-btn-inner').find('.radio-boxes-active').removeClass('radio-boxes-active');
  return $(this).parent().addClass('radio-boxes-active');
});

var months = ['January', 'Febuary', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']

function getMonthName(month) {
    return months[month];
}

$(function() {
  $( ".datepicker1" ).datepicker({ 
  numberOfMonths: 2,
  onSelect: function(dateText, inst) {
  	var weekday=new Array(7);
	weekday[0]="Sunday";
	weekday[1]="Monday";
	weekday[2]="Tuesday";
	weekday[3]="Wednesday";
	weekday[4]="Thursday";
	weekday[5]="Friday";
	weekday[6]="Saturday";
  	var date = $(this).datepicker('getDate');
  	var day  = date.getDate();
    var month = date.getMonth();
    var year = date.getUTCFullYear();
  	var dayOfWeek = weekday[date.getUTCDay()];
  	$('.datepicker1').val(dayOfWeek + ' ' + day + ' ' + getMonthName(month) + ' ' + year);

}
});

});

$(function() {
  $( ".datepicker2" ).datepicker({ 
  numberOfMonths: 2,
  onSelect: function(dateText, inst) {
  	var weekday=new Array(7);
	weekday[0]="Sunday";
	weekday[1]="Monday";
	weekday[2]="Tuesday";
	weekday[3]="Wednesday";
	weekday[4]="Thursday";
	weekday[5]="Friday";
	weekday[6]="Saturday";
  	var date = $(this).datepicker('getDate');
  	var day  = date.getDate();
    var month = date.getMonth();
    var year = date.getUTCFullYear();
  	var dayOfWeek = weekday[date.getUTCDay()];
  	$('.datepicker2').val(dayOfWeek + ' ' + day + ' ' + getMonthName(month) + ' ' + year);

}
});

});