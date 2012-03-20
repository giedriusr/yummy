class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(params[:customer])
    if @customer.save
      session[:customer_id] = @customer.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  def edit
    @customer = Customer.find(current_user)
  end

  def update
    @customer = Customer.find(current_user)
    if @customer.update_attributes(params[:customer])
      redirect_to account_path, notice: 'Updated'
    else
      render 'edit'
    end
  end

  def show
    @customer = !params[:id].nil? ? Customer.find(params[:id]) : current_user
  end

end
