class Address < ActiveRecord::Base

  attr_accessible :post_code, :country_code, :address, :city, :longitude, :latitude, :title

  validates :address, :city, :country_code, :post_code, :presence => true
  validates :country_code, :length => { :is => 2 }
  belongs_to :customer
end
