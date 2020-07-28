class OrdersController < ApplicationController

    def index
        @orders=Order.all
    end
    
    def show
        @order = Order.find(params[:id])
    end

    def new
        @order = Order.new
        @errors = flash[:errors]
    end

    def create
        order = Order.create(order_params)
        if order.valid?
            redirect_to order
        else
            flash[:errors] = order.errors.full_messages
            redirect_to new_order_path
        end
    end

    def edit
        @order = Order.find(params[:id])
    end

    def update
        order = Order.find(params[:id])
        if order.update(order_params)
            redirect_to order
        else
            redirect_to edit_order_path
        end
    end

    def destroy
        order = Order.find(params[:id])
        order.destroy
        redirect_to orders_path
    end

    def order_params
        params.require(:order).permit(:number, :customer_id, item_ids: [])
    end
end
