class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(album_id: params[:album_id])
    if @like.save
      redirect_to album_path(@like.album.id)
      flash[:notice] = 'いいねしました'
    else
      flash[:alert] = 'いいねできませんでした'
    end
  end
  

  def destroy
    @like = Like.find_by(album_id: params[:album_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
