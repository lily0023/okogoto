class Admin::DashboardsController < Admin::BaseController
  def index
    @users = User.all
    @posts = Post.all
  end
end
