class AlbumsController < ApplicationController
  def index
    @albums = Album.includes(:user)
    @album = Album.new
    @album.album_images.build
    @users = User.all.order("created_at DESC")
  end

  def new
    @album = Album.new
    @album.album_images.build
  end

  def create
    @album = Album.new(album_params)
      if @album.save
        redirect_to root_path 
      else
        @album.album_images.build
        render action: 'new'
      end
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy
    @album = Album.new
    @album.album_images.build
  end

  def show
    @user = User.find(params[:id])
    @album = Album.find(params[:id])
    @album_images = @album.album_images
    @comment = Comment.new
    @comments = @album.comments.includes(:user)
    @like = Like.new
  end

  def search
    @albums = Album.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:name])
    @albums = @tag.albums
  end

  private
  def album_params
    params.require(:album).permit(:title, album_images_attributes: [:image, :id, :_destroy]).merge(user_id: current_user.id)
  end
end
