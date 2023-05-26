class OkogotoImagesController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    okogoto = kogoto_params[:okogoto]
    okogoto_image = if params[:image] == 'kakugen'
                      KakugenImage.build(okogoto)
                    elsif params[:image] == 'kogoto'
                      KogotoImage.build(okogoto)
                    elsif params[:image] == 'friends'
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
