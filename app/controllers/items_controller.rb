class ItemsController < ApplicationController
  
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find_by(id: @item.user_id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :image).merge(user_id: current_user.id)
  end

end
