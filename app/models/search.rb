class Search
  include ActiveAttr::Model

  attribute :query
  attribute :address

  attr_accessible :query, :address

  validates :query, :address, :presence => true
end