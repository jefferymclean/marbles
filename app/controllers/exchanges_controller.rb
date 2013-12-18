class ExchangesController < ApplicationController

  def create
    username = params[:username] 
    user = User.where(username: username).first
    
    if user.present? && current_user.marbles > 0 
      user.marbles += 1
      user.save
      current_user.marbles -= 1
      current_user.save
      flash[:alert] = "You successfully transferred a marble to #{user.username}. Great job #{current_user.username}!"
    else flash[:alert] = "That user is not present OR you don't have any marbles to give. Which is it?"
    end
    redirect_to users_path
  end
end