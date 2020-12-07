class OrdersController < ApplicationController
    before_action :authorize_customer, only: [:edit, :update, :destroy]
    def index
        @orders=Order.all
    end
    
    def show
        @order = Order.find(params[:id])
    end

    # added error handling for New Order Form
    def new
        if session[:customer_id]
            @order = Order.new
            @errors = flash[:errors]
            render :new
        else
            redirect_to login_path
        end
    end

    def create
        merged_params = order_params.merge(customer_id: @current_customer.id)
        order = Order.create(merged_params)
        if order.valid?
            redirect_to order
        else
            flash[:errors] = order.errors.full_messages
            redirect_to new_order_path
        end
    end

    def edit
        @order = Order.find(params[:id])
        if @current_customer == @order.customer
            render :edit
        else
            redirect_to @order
        end   
    end

    def update
        order = Order.find(params[:id])
        order.update(order_params)
        redirect_to order
    end

    def destroy
        order = Order.find(params[:id])
        order.destroy
        redirect_to orders_path
    end

    private
    # added item_ids to order_params for Items selected in New Order Form
    def order_params
        params.require(:order).permit(:number, :customer_id, item_ids: [])
    end
    def authorize_customer
        @order = Order.find(params[:id])
        redirect_to @order unless @current_customer == @order.customer
    end
end
