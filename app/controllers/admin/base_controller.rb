class Admin::BaseController < ApplicationController
  layout 'admin/layouts/application'
  before_action :check_admin

  def check_admin
    redirect_to root_path, flash: { error: t('defaults.not_authorized') } unless current_user.admin?
  end

  def not_authenticated
    redirect_to admin_login_path, flash: { error: t('defaults.require_login') }
  end
end
