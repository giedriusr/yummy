class Office < ActiveRecord::Base
  belongs_to :provider

  geocoded_by :address
  after_validation :geocode
end
