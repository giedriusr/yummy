class Cuisine < ActiveRecord::Base

  attr_accessible :name

  has_many :provider_cuisines
  has_many :cuisines, :through => :provider_cuisines
end
