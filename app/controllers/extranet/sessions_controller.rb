class Extranet::SessionsController < Extranet::IndexController
  def new
  end

  def create
    provider = Provider.find_by_email(params[:email])
    if provider && provider.authenticate(params[:password])
      session[:provider_id] = provider.id
      redirect_to extranet_path, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:provider_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end