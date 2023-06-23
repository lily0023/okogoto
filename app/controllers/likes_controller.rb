class LikesController < ApplicationController
  before_action :require_login
  before_action :set_post
  def create
    current_user.likes.create!(post_id: @post.id)
    redirect_to post_path(@post)
  end

  def destroy
    like = current_user.likes.find(params[:id])
    like.destroy!
    redirect_to post_path(@post), status: :see_other
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
