class ItemsController < ApplicationController
 before_action :authenticate_user!, only: [:new, :edit, :destroy]
 before_action :set_item, only: [:show, :edit, :update, :destroy]

 def index
  @items = Item.includes(:user).order("created_at DESC")
 end

 def new
  @item = Item.new
 end

 def create
   @item = Item.new(item_params)
   if @item.save
    redirect_to root_path
   else
    render :new, status: :unprocessable_entity
   end
 end

 def show
 end

def edit
  unless current_user.id == @item.user_id
   redirect_to root_path
  end
  
  if Order.exists?(item_id: @item) && @item.user_id == current_user.id
    redirect_to root_path
  end
end

def update
  if @item.update(item_params)
     redirect_to item_path(@item.id)
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  if current_user.id == @item.user_id
     @item.destroy
  end
  redirect_to root_path
end

 private

 def item_params
  params.require(:item).permit(:name, :detail, :category_id, :item_condition_id, 
  :delivery_condition_id, :prefecture_id, :reach_date_id,
  :price, :image).merge(user_id: current_user.id)
 end

 def set_item
  @item = Item.find(params[:id])
 end
end
