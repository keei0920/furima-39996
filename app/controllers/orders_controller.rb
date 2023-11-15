class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new

    if current_user.id == @order_address.user_id 
      redirect_to root_path
    end
    
    if Order.exists?(item_id: @item)
      redirect_to root_path
    end
  end


  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
       @order_address.save
       redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_number, :prefecture_id, :municipality, :street_address, :building_name, :tel_number).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_def182fa9b2aefc8e023f71b" 
    Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: order_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
