class ItemsController < ApplicationController

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :state_id, :delivery_fee_id, :area_id, :delivery_date_id, :prise)
    .merge(user_id: current_user.id)
  end
end