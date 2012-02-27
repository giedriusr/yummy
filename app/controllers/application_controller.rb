class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= Customer.find(session[:customer_id]) if session[:customer_id]
  end

  def current_provider
    @current_provider ||= Provider.find(session[:provider_id]) if session[:provider_id]
  end

  def current_employee
    @current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
  end

  helper_method :current_user, :current_provider, :current_employee

  def authorize_customer
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

  def authorize_provider
    redirect_to extranet_login_url, alert: 'Not authorized' if current_provider.nil?
  end

  def authorize_employee
    redirect_to admin_login_url, alert: 'Not authorized' if current_employee.nil?
  end
end
