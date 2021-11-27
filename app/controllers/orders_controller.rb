class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]


  def index
    @item = Item.find(params[:id])
    @user = User.find_by(id: @item.user_id)
  end


  def create
 

  end

  



end


