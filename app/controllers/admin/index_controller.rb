class Admin::IndexController < ApplicationController
  layout "admin/application"
  before_filter :authorize

  def index
  end
end
