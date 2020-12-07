class ApplicationController < ActionController::Base
    #since AppController is inherited when i make a controller
    # set_current_user is called before every controller action thanks to before_action
    before_action :set_current_customer

    def set_current_customer
        @current_customer = Customer.find_by(id: session[:customer_id])
    end
end
