class PasswordResetsController < ApplicationController
  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    not_authenticated if @user.present?
  end

  def create
    @user = User.find_by(params[:email])
    @user&.deliver_reset_password_instructions!
    redirect_to login_path, flash: { success: t('.success') }
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end

    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password(params[:user][:password])
      redirect_to login_path, flash: { success: t('.success') }
    else
      flash.now[:error] = t('.fail')
      render :edit, status: :unprocessable_entity
    end
  end
end
