# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]


  
  # GET /resource/sign_in
  # def new
   # @user = User.new
  # end

  # POST /resource/sign_in
  # def create
    # @user = User.new(user_params)
    # if @user.save
      # redirect_to root_path
    # else
      # render :new
    # end
  # end

  # DELETE /resource/sign_out
  #  def destroy
  #   super
  #  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

private

# def user_params
  # params.require(:user).permit(:employee_number,:password)
# end
