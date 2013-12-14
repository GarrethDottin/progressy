$(function(){
  $('#list_content').on('click', '.thumb', function(e){
    newRating = parseInt(e.target.id, 10) + 1
    topicID = parseInt(e.target.id.split('_')[1], 10)
    peerID = $('#user_select_user_id').val()
    $.ajax({
      url: '/user_topics/' + topicID,
      type: 'put',
      data: {new_rating: newRating, peer_id: peerID}
    }).done(function(data){
      $('#list_content').html(data)
    }).fail(function(){
      console.log('failure :(')
    })
  })
})