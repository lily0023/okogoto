class PostsController < ApplicationController
  before_action :require_login, only: %i[new edit create download update destroy]
  before_action :set_my_post, only: %i[new create edit update destroy]
  before_action :set_post, only: %i[show download mobile_download]
  before_action :set_tag_all, only: %i[index new edit]
  def index
    @posts = Post.search_tag(search_params[:tag_id]).include.recent.page(params[:page]).per(6)
  end

  def show; end

  def new; end

  def edit; end

  def create
    if @post.update(post_params)
      redirect_to post_path(@post), flash: { success: t('.success') }
    else
      flash.now[:error] = t('.fail')
      render :edit, status: :unprocessable_entity
    end
  end

  def download
    data = @post.okogoto_image_data
    send_data data.read, filename: 'okogoto.png'
  end

  def mobile_download
    image = @post.make_mobile_wallpaper
    send_data image, filename: 'August_okogoto_calendar.png'
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

  def set_tag_all
    @tags = Tag.all
  end
end
