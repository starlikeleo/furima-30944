class  BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buy_destination = BuyDestination.new
  end
 
  def create
    @buy_destination = BuyDestination.new(destination_params)
    if  @buy_destination.valid?
          @buy_destination.save
        redirect_to action: :index
    else
      redirect_to action: :index
    end
  end

  private
   # 全てのストロングパラメーターを1つに統合
  def destination_params
    params.require(:buy_destination).permit(:postal_code, :delivery_area_id, :municipal_name, :house_number, :building_name, :tell).merge(user_id: params[:user_id], item_id: params[:id])
  end
end