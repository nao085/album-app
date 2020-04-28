class LikesController < ApplicationController
  def create
    @album = Album.find(params[:album_id])
    @like = current_user.likes.create(album_id: params[:album_id])
    @like.save
    #   redirect_to album_path(@like.album.id)
    #   flash[:notice] = 'いいねしました'
    # else
    #   flash[:alert] = 'いいねできませんでした'
    # end
  end
  

  def destroy
    @album = Album.find(params[:album_id])
    @like = Like.find_by(album_id: params[:album_id], user_id: current_user.id)
    @like.destroy
    # redirect_back(fallback_location: root_path)
  end
end
