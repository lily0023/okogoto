class OkogotoImagesController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    okogoto = kogoto_params[:okogoto]
    okogoto_image = case params[:image]
                    when 'kakugen'
                      KakugenImage.build(okogoto)
                    when 'kogoto'
                      KogotoImage.build(okogoto)
                    when 'friends'
                      FriendsImage.build(okogoto)
                    end
    @post = current_user.posts.new(kogoto_image: okogoto_image)
    if @post.save
      redirect_to edit_post_path(@post), flash: { success: t('.success') }
    else
      flash.now[:error] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end

  private

  def kogoto_params
    params.permit(:okogoto, :image)
  end
end
