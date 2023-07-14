class PostsController < ApplicationController
  before_action :set_post, only: %i[ edit update destroy]
  before_action :authenticate_user!, only: %i[ edit update destroy new show index]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to posts_path, notice: '投稿しました'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "更新しました" 
    else
      flash.now[:alert] = '更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: '削除しました'
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :picture_id, :picture_id_cache)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
