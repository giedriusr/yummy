class CartController < ApplicationController
  before_filter :initialize_cart
  before_filter :authorize_customer, :only => :complete

  def index
  end

  def add
    if request.post?
      @item = @cart.add(params[:id])
      flash[:notice] = 'Added to your cart!'
      redirect_to :back
    else
      redirect_to session[:search_page], :alert => 'Not allowed'
    end
  end

  def remove
    if request.post?
      @item = @cart.remove(params[:id])
      flash[:notice] = 'Removed item from your cart!'
      redirect_to :back
    else
      redirect_to session[:search_page], :alert => 'Not allowed'
    end
  end

  def clear
    if request.post?
      @cart.order_items.destroy_all
      flash[:notice] = 'Cleared the cart!'
      redirect_to cart_path
    else
      redirect_to session[:search_page], :alert => 'Not allowed'
    end
  end

  def complete
    if request.post?
      address = Address.where('customer_id = ? AND id = ?', current_user.id, params[:address_id])
      if (address.exists?)
        order = Order.new
        order.complete(current_user, address.first.id)
        order.save

        cart_items = CartItem.where(session[:cart_id])
        cart_items.each do |item|
          order_item = OrderItem.new(:price => item.price,
            :quantity => item.quantity, :comment => item.comment)
          order_item.order_id = order.id
          order_item.item_id = item.item_id
          order_item.save

          OrderMailer.confirmation(order).deliver
          session[:cart_id] = nil
          flash[:notice] = 'Your order has been saved and will be processed!'
        end
      else
        flash[:error] = 'Select your address'
      end
    end
    redirect_to cart_path
  end
end
