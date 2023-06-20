class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all.includes(:posts).order(created_at: :desc).page(params[:page]).per(10)
  end
end
