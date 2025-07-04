class Admin::BaseController < ApplicationController
  before_action :require_login
  layout 'admin/layouts/application'

  private

  def not_authenticated
    flash[:danger] = 'ログインしてください'
    redirect_to admin_login_path
  end

end
