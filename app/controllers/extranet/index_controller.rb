class Extranet::IndexController < InheritedResources::Base
  layout "extranet/application"
  before_filter :authorize_provider, :except => [:new, :create]

  def index
  end

end
