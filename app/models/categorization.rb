class Categorization < ActiveRecord::Base
  belongs_to :menu
  belongs_to :item
end
