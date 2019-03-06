class ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page]).per(10)
  end
  

  private

  def product_params
    params.require(:product).permit(:neme, :image, :description, :price)
  end
end
