class Admin::UsersController < Admin::BaseController
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = users.new(user_params)

    if user.save
      redirect_to user_path, success: 'ポストを作成しました'
    else
      flash.now[:danger] = 'ポストを作成できませんでした'
    render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to users_path, success: 'ポストを更新しました'
    else
      flash.now[:danger] = 'ポストを更新できませんでした'
      render :edit
    end
  end

  def destroy
    @user = Users.find(params[:id])
    @user.destroy!
    redirect_to users_path, success: 'ポストを削除しました'
  end

  private

  def user_params
    params.require(:user).permit(:name, :body)
  end
end
