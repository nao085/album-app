class AlbumsController < ApplicationController
  def index
    @albums = Album.includes(:user)
    @album = Album.new
    @album.album_images.build
  end

  def new
    @album = Album.new
    @album.album_images.build
  end

  def create
    @album = Album.new(album_params)
    respond_to do |format|
      if @album.save
          params[:album_images][:image].each do |image|
            @album.album_images.create(image: image, album_id: @album.id)
          end
        format.html{redirect_to root_path} 
      else
        @album.album_images.build
        format.html{render action: 'new'}
      end
    end
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy
    @album = Album.new
    @album.album_images.build
  end

  def show
    @album = Album.find(params[:id])
    @album_images = @album.album_images
  end

  def album_params
    params.require(:album).permit(:title, album_images_attributes: [:image, :id, :_destroy]).merge(user_id: current_user.id)
  end
end
