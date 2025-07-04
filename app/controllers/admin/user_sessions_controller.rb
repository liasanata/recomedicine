class Admin::UserSessionsController < Admin::BaseController
  skip_before_action :require_login
  layout 'layouts/admin_login'

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to admin_ingredients_path
    else
      flash.now[:danger] = 'ログインしてください'
      render :new
    end
  end

  def destroy
    logout
    redirect_to admin_login_path
  end
end
