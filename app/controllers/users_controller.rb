class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @power_stones = @user.have_stone_power_stones
  end

  def index
  end

  def want_stones
    @user = User.find(params[:id])
    @want_stones = @user.want_stones
  end

  def have_stones
    @user = User.find(params[:id])
    @have_stones = @user.have_stones
  end
end
