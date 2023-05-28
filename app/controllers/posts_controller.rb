class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]
  def index
    @posts = Post.all.includes(:user, :tag).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @tags = Tag.all
  end

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
    if current_path
      flash[:success] = t('.success')
      redirect_to posts_path, status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:comment, :tag_id)
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end
end
