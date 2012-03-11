class Office < ActiveRecord::Base

  attr_accessible :provider_id, :name, :city, :country_code, :phone,
                  :longitude, :latitude, :email, :address, :post_code
  belongs_to :provider

  geocoded_by :address
  after_validation :geocode
end
