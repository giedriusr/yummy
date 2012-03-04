class OrderController < ApplicationController
  before_filter :initialize_order
  before_filter :authorize_customer, :only => :complete

  def index
  end

  def add
    if request.post?
      @item = @order.add(params[:id])
      flash[:notice] = 'Added to your cart!'
      redirect_to :back
    else
      redirect_to session[:search_page], :alert => 'Not allowed'
    end
  end

  def remove
    if request.post?
      @item = @order.remove(params[:id])
      flash[:notice] = 'Removed item from your cart!'
      redirect_to :back
    else
      redirect_to session[:search_page], :alert => 'Not allowed'
    end
  end

  def clear
    if request.post?
      @order.order_items.destroy_all
      flash[:notice] = 'Cleared the cart!'
      redirect_to cart_path
    else
      redirect_to session[:search_page], :alert => 'Not allowed'
    end
  end

  def complete
    @order = Order.find(session[:order_id])
    @order.customer_id = session[:customer_id]
    @order.status = 'New'
    @order.save
    OrderMailer.confirmation(@order).deliver
    session[:order_id] = nil
    redirect_to cart_path, :notice => 'Your order has been saved and will be processed!'
  end
end
