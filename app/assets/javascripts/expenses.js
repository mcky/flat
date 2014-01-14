
// Scroll to the bottom of the table
$(".expense__table--body").scrollTop($(".expense__table--body")[0].scrollHeight);

// Hide the form until button is clicked.
//$('#expense__form--row, #expense__form--submit--row').addClass('hidden');
//$('#expense__form--new').click(function(){
//    $('#expense__form--row, #expense__form--submit--row').removeClass('hidden');
    $('#expense__form--new--row').addClass('hidden');
    
//    $(".expense__table--body").scrollTop($(".expense__table--body")[0].scrollHeight);
//});

// Add Datepicker to form field
$('#expense__form--datepicker').fdatepicker({
        format: 'dd/mm/yy',
        weekStart: '1'
});

//$(".expense__form").on("ajax:success", function(e, data, status, xhr) {
//  return $("expense__form").append(xhr.responseText);
//}).bind("ajax:error", function(e, xhr, status, error) {
//  return $(".expense__form").append("<p>ERROR</p>");
//    alert('error');
//});
