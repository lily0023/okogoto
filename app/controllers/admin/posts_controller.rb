class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: %i[show destroy]
  def index
    @tags = Tag.all
    @posts = Post.search_tag(search_params[:tag_id]).include.recent.page(params[:page]).per(6)
  end

  def show; end

  def destroy
    @post.destroy!
    flash[:success] = t('.success')
    redirect_to admin_posts_path, status: :see_other
  end

  private
  def search_params
    params.fetch(:search, {}).permit(:tag_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
