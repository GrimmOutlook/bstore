class Admin::ProductsController < ApplicationController

  layout 'admin'
  before_action :require_login

  def index
      @products = Product.order('name')
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
      if @product.save
        redirect_to admin_products_path, notice: "Product #{@product.id} was created"
      else
        render 'new'
      end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
      if @product.update(product_params)
        redirect_to admin_product_path, notice: "Product #{@product.id} was updated"
      else
        render 'edit'
      end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:success] = "Product ##{@product.id} was deleted"
    else
      flash[:danger] = "Product ##{@product.id} could not be deleted"
    end
    redirect_to admin_products_path
  end

  protected
  def product_params
    params.require(:product).permit(:name, :price)
  end

  def require_login
    unless logged_in?
      redirect_to admin_login_path, danger: 'Please log in to continue'
    end
  end

  def logged_in?
    session[:user_id].present?
  end
end
