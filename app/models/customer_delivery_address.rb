class CustomerDeliveryAddress < ActiveRecord::Base

  attr_accessible :customer_id, :post_code, :country_code, :address, :city
  belongs_to :customer
end
