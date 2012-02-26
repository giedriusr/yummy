class Menu < ActiveRecord::Base
  has_many :categorization
  has_many :items, :through => :categorization
end
