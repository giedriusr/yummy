class Admin::IndexController < ApplicationController
  layout "admin/application"
  before_filter :authorize_employee, :except => [:new, :create]

  def index
  end
end
