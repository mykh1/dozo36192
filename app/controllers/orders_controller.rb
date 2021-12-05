class OrdersController < ApplicationController

  def create 
    @order = current_user.orders.build(order_params)
    if @order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      @user = User.find(@item.user_id)
      render "items/show"
    end
  end

  private

  def order_params
    params.require(:order).permit(:item_id, :accept)
  end

end


