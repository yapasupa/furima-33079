class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update]

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
end

def update
  if @item.update(item_params)
    redirect_to item_path
  else
    render :new
 end
end                                                                

def destroy
  @item = Item.find(params[:id])
  if @item.destroy
    redirect_to root_path
  else
    render :show
 end
end

private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :state_id, :delivery_fee_id, :delivery_area_id, :delivery_date_id, :price, :image).merge(user_id: current_user.id )
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  def move_to_index
    if current_user.id != @item.user.id
      redirect_to root_path
    end
  end



end






