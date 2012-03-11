class Menu < ActiveRecord::Base

  attr_accessible :name, :photo

  has_many :categorization
  has_many :items, :through => :categorization

end
