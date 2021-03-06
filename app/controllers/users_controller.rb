class UsersController < ApplicationController
# before_action :logged_in_user
# before_action :correct_user,   only: [:edit, :update]
before_action :admin_user

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "登録に成功しました"
      redirect_to users_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "更新に成功しました"
      redirect_to users_url
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to users_url
  end


private
  def user_params
    params.require(:user).permit(:name,:email,:employee_number,:password,:password_confirmation)
    # params.permit(:name,:email,:employee_number,:password,:password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to login_url
    end
  end

    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

      # 正しいユーザーかどうか確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == admin_user
    # redirect_to(root_url) unless current_user?(@user)
    # ここをアドミンでしかできないようにするには・・・どうする？
  end

end
