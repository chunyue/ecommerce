class ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page]).per(10)
  end

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_cart_item(@product)

    #redirect_to root_path
  end


  def add_to_cart_quantity
    @product = Product.find(params[:id])
    current_cart.add_cart_item_quantity(@product)

    #redirect_to root_path
  end

  def sub_to_cart_quantity
    @product = Product.find(params[:id])
    current_cart.sub_cart_item_quantity(@product)

    redirect_to root_path
  end

  def remove_item
    @product = Product.find(params[:id])
    cart_item = current_cart.cart_items.find_by(product_id: @product.id)
    cart_item.destroy

    redirect_to root_path
  end
  

  private

  def product_params
    params.require(:product).permit(:neme, :image, :description, :price)
  end
end
