class UsersController < ApplicationController
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
    user = @user = User.new user_params
    if user.save
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
end
