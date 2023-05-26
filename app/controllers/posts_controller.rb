class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]
  def index
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), flash: { success: t('.success') }
    else
      flash.now[:error] = t('.fail')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_path, flash: { success: t('.success') }
  end

  private

  def post_params
    params.require(:post).permit(:comment)
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end
end
