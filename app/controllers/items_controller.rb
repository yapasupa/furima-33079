class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update]
  before_action :authenticate_user!, except: [:index, :show]

def index
  @items = Item.all.order("id DESC")
end

def new
  @item = Item.new
end

def create
  @item =Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new
  end
end

def show
end

def edit
  if current_user.id != @item.user.id
    redirect_to root_path
  end
end

def update
  if @item.update(item_params)
    redirect_to item_path
  else
    render :new
end
end

def set_item
  @item = Item.find(params[:id])
end

private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :state_id, :delivery_fee_id, :delivery_area_id, :delivery_date_id, :price, :image).merge(user_id: current_user.id )
  end



end






