class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @power_stones = @user.have_stone_power_stones
  end

  def index
  end
end
