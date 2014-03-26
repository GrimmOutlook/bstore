class ProductsController < ApplicationController



  def index
    @products = Product.order('name').all
  end

  def show
    params[:id]
  end
end
