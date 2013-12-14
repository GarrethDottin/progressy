$(function(){

  $('#user_select_user_id').on('change', function(e){
    peerID = e.target.value
    $.ajax({
      url: '/peer_list',
      type: 'post',
      data: {peer_id: peerID}
    }).done(function(data){
      console.log(data)
      $('#list_content').html(data)
    })
  })

})