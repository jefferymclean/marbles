class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = user.id #auto log-in
      redirect_to users_path
    else
      render :new
    end
  end

  # def update
  #   @user = User.find(params[:id])

  #   if @user.update_attributes(user_params)
  #     redirect_to user_path(@user)
  #   else
  #     render :new
  #   end
  # end

  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy
  #   redirect_to users_path
  # end

  protected

  def user_params 
    params.require(:user).permit(
      :username, :email, :password, :password_confirmation
      )
  end
end
