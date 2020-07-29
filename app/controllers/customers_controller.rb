class CustomersController < ApplicationController

    def new
        @customer = Customer.new
        @errors = flash[:errors]
    end

    def show
        @customer = Customer.find(params[:id])
    end

    def create
        @customer = Customer.create(customer_params)
        
        if @customer.valid?
            #store the customer id, that was just cerated, into a session hash to keep them logged in and track them 
            session[:customer_id] = @customer.id
            redirect_to customer_path(@customer)
        else
            #show errors messages
            flash[:errors] = @customer.errors.full_messages
            redirect_to '/signup'
        end
    end

    private 
    
    def customer_params
        params.require(:customer).permit(:name, :username, :password)
    end
end
