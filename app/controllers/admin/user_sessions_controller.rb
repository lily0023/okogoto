class Admin::UserSessionsController < Admin::BaseController
  skip_before_action :require_login
  skip_before_action :check_admin
  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to admin_root_path, success: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    flash[:success] = t('.success')
    redirect_to admin_login_path, status: :see_other
  end
end
