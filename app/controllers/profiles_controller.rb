class ProfilesController < ApplicationController
  before_action :require_login
  before_action :set_user
  def show
    @posts = @user.posts.includes(:tag, :likes).order(created_at: :desc).page(params[:page]).per(3)
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, flash: { success: t('.success') }
    else
      flash.now[:error] = t('.fail')
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :age, :gender)
  end
end
