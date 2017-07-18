class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      create_activated user
    else
      flash.now[:danger] = t "error_valid"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def create_activated user
    if user.activated?
      log_in user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      redirect_back_or user
    else
      message  = t "not_activated"
      flash[:warning] = message
      redirect_to root_url
    end
  end

  def create_activated user
    if user.activated?
      log_in user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      redirect_back_or user
    else
      message  = t "not_activated"
      message += t "check_email_link"
      flash[:warning] = message
      redirect_to root_url
    end
  end
end
