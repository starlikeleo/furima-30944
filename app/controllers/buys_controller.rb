class  BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index]

  def index
    # @item = Item.find(params[:item_id])
    @buy_destination = BuyDestination.new
  end
 
  def create
    # @item = Item.find(params[:item_id])
    @buy_destination = BuyDestination.new(destination_params)
    if  @buy_destination.valid?
      pay_item
      @buy_destination.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
   # 全てのストロングパラメーターを1つに統合
  def destination_params
    params.require(:buy_destination).permit(:postal_code, :delivery_area_id, :municipal_name,:house_number, :building_name, :tell)
    .merge(user: current_user.id, item: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: destination_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def contributor_confirmation
    redirect_to root_path if current_user == @item.user
  end
end