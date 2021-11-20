class Admin::UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
  end

  private

  def user_params
    params.require(:user).permit(:employee_number, :last_name, :first_name, :last_name_reading, :first_name_reading, :nickname, :email, :encrypted_password)
  end
end
