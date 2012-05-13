class Search
  include ActiveAttr::Model

  attribute :query
  attribute :address
  attribute :longitude
  attribute :latitude
  attribute :post_code
  attribute :country_code

  attr_accessible :query, :address, :longitude, :latitude, :post_code, :country_code

  validates :query, :address, :presence => true
end