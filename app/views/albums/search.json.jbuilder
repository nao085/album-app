json.array! @albums do |album|
  json.id album.id
  json.title album.title
  json.images album.album_images.last.image.url
  json.user_id album.user_id
  json.name album.user.name
  json.user_sign_in current_user
  json.likes_count album.likes.count
  json.comments_count album.comments.count
end