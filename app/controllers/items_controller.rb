class ItemsController < ApplicationController

  def index
    @items = Item.includes(:images).order('created_at DESC')
    @item = Item.new
  end

  def new
    @item = Item.new
    @item.item_images.build
    @parents = Category.all.order("id ASC").limit(13)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def convert_int(data)
    
  end

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :brand, :condition, :postage, :region, :shipping_date, :price,:shipping_means,:prefecture_id, item_images_attributes: :image_url).merge(saler_id: current_user.id,buyer_id: current_user.id)
  end
end
