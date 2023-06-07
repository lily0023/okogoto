class OkogotoImagesController < ApplicationController
  def new
    @post = Post.new
    @okogoto_image = OkogotoImage.new
  end

  def create
    @okogoto_image = OkogotoImage.new(okogoto_params)
    if @okogoto_image.valid?
      okogoto_image = @okogoto_image.composite_text_and_image
      @post = current_user.posts.new(kogoto_image: okogoto_image)
      redirect_to new_post_path(id: @post.id), flash: { success: t('.success') } if @post.save
    else
      flash.now[:error] = 'オコゴト画像の作成に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def okogoto_params
    params.permit(:okogoto, :image)
  end
end
