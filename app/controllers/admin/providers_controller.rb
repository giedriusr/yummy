class Admin::ProvidersController < Admin::IndexController
  respond_to :html, :json, :xml
  before_filter :provider, :except => [:index, :new, :create]

  def index
    @providers = Provider.all
    respond_with(@providers)
  end

  def show
  end

  def new
    @provider = Provider.new
  end

  def edit
  end

  def create
    @provider = Provider.new(params[:provider])

    respond_to do |format|
      if @provider.save
        redirect_to admin_providers_path, notice: 'Provider was successfully created.'
      else
        render 'new'
      end
    end
  end

  def update
    if @provider.update_attributes(params[:provider])
      redirect_to admin_provider_path(@provider), notice: 'Provider was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @provider = Provider.find(params[:id])
    @provider.destroy
    redirect_to admin_providers_path, notice: 'Provider was deleted'
  end

  private

    def provider
      @provider = Provider.find(params[:id])
    end

end
