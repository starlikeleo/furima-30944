class  BuysController < ApplicationController
  before_action :set_buy_destination, only: [:index, :new, :create]

  def index
    @buy_destination = BuyDestination.new
  end
 
  def new
    @buy_destination = BuyDestination.new
  end
 
  def create
    @buy_destination = BuyDestination.create(destination_params)
      if @user_destination.valid?
        @user_destination.save
        redirect_to action: :index
      else
        redirect_to action: :index
      end
  end
 
  private
   # 全てのストロングパラメーターを1つに統合
  def destination_params
    params.require(:buy_destination).permit(:postal_code, :delivery_area_id, :municipal_name, :house_number, :building_name, :tell).
    merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_buy_destination
    @buy_destination = Item.find(params[:id])
  end

end