class ProductController < ApplicationController
	skip_before_action :verify_authenticity_token  

  def index
	  products = Product.all
	  render json: products
  end

	def create
	  inventory_product = InventoryProduct.find_by(id: params[:id])
	  product = Product.find_by(id: params[:id])

	  unless !product
	  	render json: { "message": "Product is already present" }
	    return
	  end

	  unless inventory_product
	    render json: { "message": "Product not found in the inventory" }
	    return
	  end

	  @product = Product.find_or_initialize_by(id: params[:id]) do |product|
	    product.title = inventory_product.title
	    product.price = inventory_product.price
	    product.category = inventory_product.category
	    product.image = inventory_product.image
	  end

	  if @product.save
	    render json: { "message": "Product is added to your list" }
	  else
	    render json: { "message": "Failed to add product to list", "errors": @product.errors.full_messages }
	  end
  end

  def destroy
   product = Product.find_by(id: params[:id])
   if product.nil?
	   render json: { "message": "Product is not present" } 
	   return 
 	 end
   product.destroy if product.present?
   render json: { "message": "Product is removed" }

  end


end
