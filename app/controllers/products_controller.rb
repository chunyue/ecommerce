class ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page]).per(10)
  end

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_cart_item(@product)

    redirect_to root_path
  end
  

  private

  def product_params
    params.require(:product).permit(:neme, :image, :description, :price)
  end
end
