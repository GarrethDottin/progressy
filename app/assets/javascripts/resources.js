$( document ).ready(function() {
  $('#topics').on('click',"a", function(e) {
    console.log($(this).attr("href"))
    e.preventDefault()
    $.get({
      url: $(this).attr("href")
      }).done(function(data) {
        console.log("its really working")
      }).fail(function() {
        console.log("its not] working")
      })
    })
})
