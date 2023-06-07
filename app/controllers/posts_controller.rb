class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :set_my_post, only: %i[new create edit update destroy]
  before_action :set_post, only: %i[show download]
  def index
    @tags = Tag.all
    @posts = if search_params[:tag_id].present?
               Post.where(tag_id: search_params[:tag_id]).includes(:user, :tag,
                                                                   :likes).order(created_at: :desc).page(params[:page]).per(6)
             else
               Post.all.includes(:user, :tag, :likes).order(created_at: :desc).page(params[:page]).per(6)
             end
  end

  def show; end

  def new
    @tags = Tag.all
  end

  def edit
    @tags = Tag.all
  end

  def create
    if @post.update(post_params)
      redirect_to post_path(@post), flash: { success: t('.success') }
    else
      flash.now[:error] = t('.fail')
      render :edit, status: :unprocessable_entity
    end
  end

  def download
    data = URI.open("https://okogoto.s3.ap-northeast-1.amazonaws.com/#{@post.kogoto_image.path}", 'r')
    send_data data.read, filename: 'okogoto.png'
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
    if request.referer&.include?('/posts') && request.referer&.include?('/new')
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
