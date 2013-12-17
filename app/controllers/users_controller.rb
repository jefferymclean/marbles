class UsersController < ApplicationController

  def index
    
  end


  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id #auto log-in
      redirect_to users_path, notice: "Welcome to Marbles, #{@user.username}!"
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  protected

  def user_params 
    params.require(:user).permit(
      :username, :email, :password, :password_confirmation
      )
  end
end
