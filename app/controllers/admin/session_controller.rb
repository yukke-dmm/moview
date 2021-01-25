class Admin::SessionController < ApplicationController

  def new
  end

  def create
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      admin_log_in admin
      redirect_to admin_users_url
    else
      flash.now[:danger] = '入力した情報に誤りがあります。'
      render 'new'
    end
  end

  def destroy
    admin_log_out
    redirect_to root_url
  end
end
