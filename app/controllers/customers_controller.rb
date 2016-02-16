class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.new(customer_params)
      if @customer.save
        redirect_to action: :index
      else
        redirect_to action: :new
      end
  end

  def update
    @customer = Customer.find(params[:id])
      if @customer.update_attributes(customer_params)
        redirect_to action: :index
      else
        redirect_to action: :edit
      end
  end

  def destroy
    Customer.destroy(params[:id])    
    redirect_to action: :index
  end

  private
  def customer_params
    params.require(:customer).permit(:title, :comment) 
  end
end
