class ApplicationController < ActionController::Base
  private

  def not_authenticated
    redirect_to login_path, flash: { error: t('defaults.require_login') }
  end
end
