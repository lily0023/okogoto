class UserSessionsController < ApplicationController
  before_action :require_login, only: %i[destroy]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to posts_path, success: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    flash[:success] = t('.success')
    redirect_to login_path, status: :see_other
  end
end
