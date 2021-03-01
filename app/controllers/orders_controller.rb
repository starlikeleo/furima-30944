class OrdersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(order_params)
    if @user.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private

  def order_params
    params.require(:buy).permit(:name, :name_reading, :nickname)
  end
end