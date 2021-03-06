class SessionsController < ApplicationController

  def new
  end

  def destroy
    session[:user_id] = nil
    redirect_to users_path, notice: "Peace!"
  end
    
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path, notice: "Welcome back, #{user.username}!" 
    else
      flash.now[:alert] = "Log In Failed..."
      render :new
    end
  end
end
