class Employee < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :first_name, :last_name
end
