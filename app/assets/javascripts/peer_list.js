$(function(){

  $('#user_select_user_id').on('change', function(e){
    peerID = e.target.value
    $.ajax({
      url: '/peer_list',
      type: 'post',
      data: {peer_id: peerID}
    }).done(function(data){
      $('#list_content').html(data)
    })
  })

})