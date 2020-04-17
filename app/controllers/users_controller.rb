class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @album = Album.new
    @album.album_images.build
  end

  def edit
    @user = User.find(params[:id])
    @album = Album.new

  end

  def update
    @user = User.find(params[:id])
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :avatar_cache, :remove_avatar)
  end
end
