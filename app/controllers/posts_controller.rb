class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :set_my_post, only: %i[edit update destroy]
  before_action :set_post, only: %i[show download]
  def index
    @tags = Tag.all
    @posts =  if search_params[:tag_id].present?
                Post.where(tag_id: search_params[:tag_id]).includes(:user, :tag).order(created_at: :desc)
              else
                Post.all.includes(:user, :tag).order(created_at: :desc)
              end
  end

  def show; end

  def download
    data = File.open("s3://okogoto/#{@post.kogoto_image_url}", 'r')
    send_data data.read, filename: 'okogoto.png'
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
    if request.referer&.include?('/posts') && request.referer&.include?('/edit')
      redirect_to new_okogoto_image_path, status: :see_other
    else
      flash[:success] = t('.success')
      redirect_to posts_path, status: :see_other
    end
  end

  private

  def post_params
    params.require(:post).permit(:comment, :tag_id)
  end

  def search_params
    params.fetch(:search, {}).permit(:tag_id)
  end

  def set_my_post
    @post = current_user.posts.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
