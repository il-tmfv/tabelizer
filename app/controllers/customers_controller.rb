class CustomersController < ApplicationController
    def index
        @customers = Customer.all
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
            redirect_to :customers_index
        else
            redirect_to :customer_new
        end
    end

    def update
        @customer = Customer.find(params[:id])
        if @customer.update_attributes(customer_params)
            redirect_to :customers_index
        else
            redirect_to :customer_edit
        end
    end

    def destroy
        Customer.destroy(params[:id])    
        redirect_to :customers_index
    end

    private
    def customer_params
       params.require(:customer).permit(:title, :comment) 
    end
end
