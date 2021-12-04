class OrdersController < ApplicationController

  def create 
    @item = Item.find(params[:item_id])
    @user = User.find(@item.user_id)
    @order = current_user.orders.build(order_params)
    if @order.save
      redirect_to root_path
    else
      render "items/show"
    end
  end

  private

  def order_params
    params.permit(:item_id, :accept)
  end

end


