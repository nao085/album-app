$(function() {

  var search_list = $(".grid");
  function appendAlbum(album) {
    var html = `<div class="card">
                  <a href="/albums/${album.id}" class= "card__image" %>
                    <img src="${album.images}" class= "cardImg" width="293" height="293"/>
                  </a>
                  <p>
                    ${album.title}
                  </p>
                  <span>
                    ${album.name}
                  </span>
                  <div class="iconBox">
                    <i class="fas fa-heart"></i>
                    <div class="likes-count">
                      ${album.likes_count}
                    </div>
                    <i class="fas fa-comment commentIcon"></i>
                    <div class="commentConut">
                      ${album.comments_count}
                    </div>
                  </div>
                </div>`
    search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    var html = `<div class='no-searchResult'>${ msg }</div>`
    search_list.append(html);
  }

  $(".search__box--text").on("keyup", function() {
    var input = $(".search__box--text").val();
    $.ajax({
      type: 'GET',
      url: '/albums/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(albums) {
      console.log(albums);
      search_list.empty();
      if (albums.length !== 0) {
        albums.forEach(function(album){
          appendAlbum(album);
        });
      }
      else {
        appendErrMsgToHTML("一致するアルバムはありません。");
      }
    })
  });
});