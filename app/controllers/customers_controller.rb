class CustomersController < ApplicationController
    def index
        @customers = Customer.all
    end

    def show
        @customer = Customer.find(params[:id])
    end

    def create
        @customer = Customer.new(customer_params)
        if @customer.save
            render :index
        else
            render :new
        end
    end

    def destroy
        Customer.destroy(params[:id])    
        render :index
    end

    private
    def customer_params
       params.require(:customer).permit(:title, :comment) 
    end
end
