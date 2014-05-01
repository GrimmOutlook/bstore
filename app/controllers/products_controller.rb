class ProductsController < ApplicationController

  def index
    @products = Product.order('name')

    if params[:search].present?
      @products = @products.search(params[:search])
    end

    if params[:min_price].present?
      @products = @products.min_price(params[:min_price])
    end

    if params[:max_price].present?
      @products = @products.max_price(params[:max_price])
    end

  end

  def show
    @product = Product.find(params[:id])
  end

  protected
  def product_params
    params.require(:product).permit(:name, :price)
  end
end
