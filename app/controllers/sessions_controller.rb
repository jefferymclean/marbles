class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:email])
      session[:user_id] = user.user_id
      redirect_to users_path 
    else
      render :new
    end
  end
end
