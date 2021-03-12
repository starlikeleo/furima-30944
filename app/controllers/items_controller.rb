class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @items = Item.all
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
  end
  def edit
  end
  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to item_path(@item)
    end
  end
  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :state_id, :delivery_fee_id, :area_id,:delivery_date_id, :price).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  def set_item
    @item = Item.find(params[:id])
  end
  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end
end