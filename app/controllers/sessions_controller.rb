class SessionsController < ApplicationController
  #skip_before_action :authorized, only: [:new, :create]

  def new

    #flash is a method that persists for 1 additinal request
    #saves it to an @error instance see line 26 & 27
    @errors = flash[:errors]
  end

  def create

    #find the user in the database, from the session in new with the username
    customer = Customer.find_by(username: params[:session][:username])

    #compare password that was passed into the form
    #see customer.rb line 29 to learn about authenticate
    if customer.authenticate(params[:session][:password])

      #if true, save user id to session
      session[:customer_id] = customer.id

      #redirect user to their show page
      redirect_to customer_path(customer)
    else

      #if false, save error messasges for this customer, send back to login
      flash[:errors] = @customer.errors.full_messages
      redirect_to login_path
    end

    def destroy

      #loging out a session is deleting the id within session hash. does not affect id in database
      session.delete(:customer_id)
      redirect_to login_path
    end
  end
end
