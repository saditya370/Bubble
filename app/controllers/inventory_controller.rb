class InventoryController < ApplicationController
  def index
    @all_products = InventoryProduct.all
    render json: @all_products
  end
end
