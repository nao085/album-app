class CommentsController < ApplicationController
  before_action :set_album

  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to album_path(@album)}
      format.json
    end
  end

  def destroy
    # @comment = @album.comments.find(params[:id])
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, album_id: params[:album_id])
  end

  def set_album
    @album = Album.includes(comments: :user).find(params[:album_id])
  end
end
