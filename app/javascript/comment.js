$(document).on('turbolinks:load',function() {
  function buildHTML(comment){
    var avatarhtml = ` <a href="/users/${comment.user_id}" %>
    <img src="/assets/no_avatar-71898c514446c449f2cc8c70dfe1ce1b34ccbe02d5e93f151612f41c9834536a.png"  width="56" height="56" class= "postUser_box-avatar"/>`;
    var html = `<li class='commentBox-innerList'id='comment-${comment.id}'>
                  <div class='comment-user'>
                    ${ avatarhtml }
                    <div class='comment-user-name'>
                      ${ comment.user_name }
                    </div>
                  </div>
                  <div class='comment-body'>
                    ${ comment.text }
                    <div class='comment-icons'>
                      <div class='comment-icons-left'>
                        <i class='far fa-clock'></i>
                        <span data-livestamp="${comment.created_at}">
                         前
                        </span>
                      </div>
                      <div class='comment-icons-right'>
                        <div class='comment-delete'>
                          <a href="/albums/${comment.album_id}/comments/${comment.id}" class= "card__image" data-method="delete" data-remote = "true"%>
                            <i class="fas fa-trash-alt"></i>
                        </div>
                      </div>
                    </div>
                  </div>
                </li> `
     return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.commentBox-inner').append(html);
      $('.textarea') .val('');
      $('.commentBtn').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});