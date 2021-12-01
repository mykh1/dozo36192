class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]



  def create 
    @item = Item.find(params[:item_id])

  end

  


end


