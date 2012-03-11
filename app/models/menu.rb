class Menu < ActiveRecord::Base
  has_many :categorization
  has_many :items, :through => :categorization

  attr_accessible :provider_id, :name, :photo
end
