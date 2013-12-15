$(function() {
  $('.toggle-button').on("click", function(e) {
    e.preventDefault()
    $('.view-toggle').toggleClass('hidden')
  })
})