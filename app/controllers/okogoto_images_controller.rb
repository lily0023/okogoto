class OkogotoImagesController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    okogoto = kogoto_params[:okogoto]

    if okogoto.blank?
      flash.now[:error] = 'オコゴトを入力してください'
      render :new, status: :unprocessable_entity
    else
      okogoto_image = case params[:image]
                      when 'kakugen'
                        KakugenImage.build(okogoto)
                      when 'kogoto'
                        KogotoImage.build(okogoto)
                      when 'friends'
                        FriendsImage.build(okogoto)
                      end
      @post = current_user.posts.new(kogoto_image: okogoto_image)
      @post.save
      redirect_to edit_post_path(@post), flash: { success: t('.success') }
    end
  end

  private

  def kogoto_params
    params.permit(:okogoto, :image)
  end
end
