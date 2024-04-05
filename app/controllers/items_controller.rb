class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @items = Item.all.order(created_at: :DESC)
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
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :category_id, :condition_id, :shipping_cost_id,
                                 :prefecture_id, :shipping_duration_id).merge(user_id: current_user.id)
  end
end
