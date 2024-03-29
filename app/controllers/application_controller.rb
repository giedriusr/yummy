class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale, :prepare_for_mobile, :get_search

  def set_locale
    # available_locales = [:en, :el]
    session[:locale] = params[:locale] if params[:locale]
    session[:locale] = I18n.default_locale unless session[:locale]
    I18n.locale = session[:locale]
  end

  def get_search
    if session[:search].present?
      @search = session[:search]
    else
      @search = Search.new
    end
  end

  private

  def initialize_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

  def current_user
    @current_user ||= Customer.find(session[:customer_id]) if session[:customer_id]
  end

  def current_provider
    @current_provider ||= Provider.find(session[:provider_id]) if session[:provider_id]
  end

  def current_employee
    @current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
  end

  def authorize_customer
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

  def authorize_provider
    redirect_to extranet_login_url, alert: 'Not authorized' if current_provider.nil?
  end

  def authorize_employee
    redirect_to admin_login_url, alert: 'Not authorized' if current_employee.nil?
  end

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == '1'
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end

  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    # request.format = :mobile if mobile_device?
  end

  helper_method :current_user, :current_provider, :current_employee, :mobile_device?
end
