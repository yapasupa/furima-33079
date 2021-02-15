class ItemsController < ApplicationController
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
  @item =Item.find(params[:id])
end

def edit
  @item =Item.find(params[:id])
  if current_user.id != @item.user.id
    redirect_to root_path
  end
end

def update
  @item =Item.find(params[:id])
  if @item.update(item_params)
    redirect_to item_path
  else
    render :new
end
end

private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :state_id, :delivery_fee_id, :delivery_area_id, :delivery_date_id, :price, :image).merge(user_id: current_user.id )
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @prototype.user
  end

end




