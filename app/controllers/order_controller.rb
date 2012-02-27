class OrderController < ApplicationController
  before_filter :initialize_order

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
end
