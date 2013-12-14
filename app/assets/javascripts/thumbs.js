$(function(){
  $('.thumb').on('click', function(e){
    newRating = parseInt(e.target.id, 10) + 1
    topicID = parseInt(e.target.id.split('_')[1], 10)
    $.ajax({
      url: '/user_topics/' + topicID,
      type: 'put',
      data: {new_rating: newRating}
    })
  })
})