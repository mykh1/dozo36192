class NicknamesController < ApplicationController

  def edit
    #  @user = User.find(params[:id])
    # if @user.nickname != nil
    #   redirect_to edit_nickname_path
    # end
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else 
      render :edit
    end
  end

  private


  def user_params
    params.require(:user).permit(:nickname)
  end
end
