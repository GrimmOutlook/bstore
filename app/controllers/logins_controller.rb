class LoginsController < ApplicationController

  def new
    render 'new'
  end

  def create
    customer = Customer.find_by(email: params[:email])
    if customer.try(:authenticate, params[:password])
      session[:customer_id] = customer.id
      redirect_to root_path
    else
      flash.now[:danger] = 'Log In Failed'
      render 'new'
    end
  end

  def destroy
    session[:customer_id] = nil
    redirect_to :back
  end


end
