class OrdersController < ApplicationController

  def create 
    @order = current_user.orders.build(order_params)
    if @order.save
      redirect_to root_path
    else
      # 保存に失敗した場合はcreateアクションがitem/show.html.erbを利用してHTMLを生成する
      @item = Item.find(params[:item_id]) # items/show.html.erbでは@itemを利用しているので、該当のitemを取得しておく
      render "items/show" # views/items/show.html.erbを利用する。
    end
  end

  private

  def order_params
    # paramsを実行すると
    # { commit: '決定', order: { item_id: 1, accept: 0 } }
    # のような感じが返り値に返ってくるので、requireとpermitで必要なものだけ取り出す
    params.require(:order).permit(:item_id, :accept)
  end

end


