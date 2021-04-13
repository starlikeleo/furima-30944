class  BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_param, only: [:index, :create]
  # before_action :contributor_confirmation, only: [:index, :create]

  def index
    redirect_to root_path if @item.buy || current_user = @item
    @buy_destination = BuyDestination.new
  end
  def create
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
  def destination_params
    params.require(:buy_destination).permit(:postal_code, :delivery_area_id, :municipal_name,:house_number, :building_name, :tell)
    .merge(user: current_user.id, item: params[:item_id], token: params[:token])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: destination_params[:token],
      currency: 'jpy')
  end
  def set_param
    @item = Item.find(params[:item_id])
    @buys = Buy.all
  end

  # def contributor_confirmation
  #   @buys.each do |buy| 
  #     redirect_to root_path if (@item.id  == buy.item)
  #   end
  # end
end

# @item.buy ：商品の購入履歴