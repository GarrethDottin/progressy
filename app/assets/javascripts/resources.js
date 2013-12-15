$( document ).ready(function() {
  $('#list_content').on('click',".topic_link", function(e) {
    route = $(this).attr("href")
    peerID = $('#user_select_user_id').val()
    e.preventDefault()
    $.ajax({
      url: route,
      data: {peer_id: peerID}
    }).done(function(data) {
      $('#resources').html(data)
      $('#chart_div').hide()
    }).fail(function() {
      console.log("its not working")
    })
  })

  $("#list_content").on('submit', '#display', function(e){
    e.preventDefault()
    console.log("mayor mccheese")
    id = $('#resource_topic_id').attr('value')
    value = $('#resource_content').val()
    peerID = $('#user_select_user_id').val()
    $.ajax({
      url: '/resources',
      type: 'post',
      data: { resource: {content: value, topic_id: id}, peer_id: peerID}
    }).done(function(data, b, c){
      $('#resources').html(data)
      $('#resource_content').val('')
    }).fail(function() {
      console.log("this is not working")
    })
  })
})