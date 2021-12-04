class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]



  def create 
# binding.pry
    @item = Item.find(params[:item_id])

    redirect_to root_path
  end

  


end


