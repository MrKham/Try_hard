class UsersController < ApplicationController
  before_action :create_user, only: :create

  def new
    @user = User.new
  end

  def show
    user = @user = User.find_by id: params[:id]
    return if user
    @user = user
    flash[:danger] = t "error_user"
  end

  def create
    if user.save
      log_in user
      @user = user
      flash[:success] = t "welcome"
      redirect_to user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def create_user
    @user = User.new user_params
  end
end
