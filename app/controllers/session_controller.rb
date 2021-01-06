class SessionController < ApplicationController

  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		redirect_to users_url
  	else
  		flash.now[:danger] = '入力した情報に誤りがあります。'
  		render 'new'
  	end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
