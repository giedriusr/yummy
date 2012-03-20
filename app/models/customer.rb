class Customer < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :email_confirmation, :password, :password_confirmation,
                  :first_name, :last_name, :phone

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, :presence => true,
                    :uniqueness => { :case_sensitive => false },
                    :confirmation => true,
                    :on => :create,
                    :format => { :with => email_regex }

  validates :password, :presence => true,
                       :confirmation => true,
                       :on => :create,
                       :length => { :within => 6..30 }

  has_many :addresses

end
