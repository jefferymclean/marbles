class ExchangesController < ApplicationController

  def create
    username = params[:username] 
    user = User.where(username: username).first
    
    if user.present?
      user.marbles += 1
      user.save
      current_user.marbles -= 1
      current_user.save
    end
  end
end
