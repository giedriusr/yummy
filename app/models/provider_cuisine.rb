class ProviderCuisine < ActiveRecord::Base
  belongs_to :provider
  belongs_to :cuisine
end
