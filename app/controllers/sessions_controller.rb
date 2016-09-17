class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_url
      flash[:success] = "Welcome to admin mode!"
    else
      flash.now[:danger] = "Invalid username or password."
      render 'new'
    end
  end

  def destroy
    log_out if logged_in
    flash[:success] = "Successfully logged out."
    redirect_to root_url
  end
end
