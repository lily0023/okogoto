class Admin::BaseController < ApplicationController
  layout 'admin/layouts/application'
  before_action :check_admin

  def check_admin
    redirect_to login_path, flash: { error: t('defaults.not_authorized') } unless current_user.admin?
  end
end
