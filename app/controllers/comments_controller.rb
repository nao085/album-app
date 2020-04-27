class CommentsController < ApplicationController
  before_action :set_album

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to album_path(@album)
    else 
      redirect_to album_path(@comment.album.id),alert: 'コメントの投稿に失敗しました'
    end
  end

  def destroy
    @comment = @album.comments.find(params[:id])
    @comment.destroy
    redirect_to album_path(@album)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, album_id: params[:album_id])
  end

  def set_album
    @album = Album.includes(comments: :user).find(params[:album_id])
  end
end
