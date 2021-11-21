class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!
  before_action :if_not_admin

  private
  def if_not_admin
    unless user_signed_in? && current_user.admin? 
      redirect_to root_path 
  end
  end
end