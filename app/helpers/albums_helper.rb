module AlbumsHelper
  def render_with_hashtags(title)
    title.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, "/albums/hashtag/#{word.delete("#")}"}.html_safe
  end
end
