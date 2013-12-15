$( document ).ready(function() {
  $('#topics').on('click',"a", function(e) {
    route = $(this).attr("href")
    e.preventDefault()
    $.ajax({
      url: route
      }).done(function(data) {
        console.log(data)
        $('#resources').html(data)
        $('#chart_div').hide()
      }).fail(function() {
        console.log("its not] working")
      })
    })
})
