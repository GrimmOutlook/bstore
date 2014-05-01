class CustomersController < ApplicationController

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to products_path, success: 'You have created a Customer account'
    else
      render :new
    end
  end

  def update
  end


  def verify
    customer = Customer.verify(params[:token])
      if customer
        #TO DO: set current_customer
        redirect_to products_path, success: 'Your account has been verified'
      else
        redirect_to root_path, danger: "You need to get verified"
      end
  end

  private
    def customer_params
        params.require(:customer).permit(:name, :email, :password, :zip_code)
    end


end
