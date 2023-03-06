$('.hi').change(function(){
   let song_seq = $(this).val();
   console.log(song_seq)
   $.ajax({
      url: 'MainLikeService.do',
      type: 'get',
      dataType : "json",
      data: {"song_seq": song_seq},
      success: function(data) {
      },
      error: function(error) {
      }
   })
})
