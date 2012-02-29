class Admin::TranslationsController < Admin::IndexController
  def index
    @translations = I18n.backend.store
  end

  def create
    I18n.backend.store_translations(params[:locale], {params[:key] => params[:value]}, :escape => false)
    redirect_to admin_translations_path, :notice => "Added translation"
  end
end
