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

 $("#display").on('submit',function(e){
    e.preventDefault()
    console.log($(this))
    id = $('#resource_topic_id').attr('value')
    value = $('#resource_content').val()
    $.ajax({
       url: '/resources',
       type: 'post',
       data: { resource: {content: value,topic_id: id}}
   }).done(function(data){
    console.log(data + "This is working")
   }).fail(function() {
     console.log("this is not working")

   })
    })
  })