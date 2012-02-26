class Provider < ActiveRecord::Base
  validates :name, :presence => true, :length => { :maximum => 50 }
  validates :user_name, :presence => true

  validates :password, :presence => true,
                       :confirmation => true,
                       :on => :create,
                       :length => { :within => 6..30 }

  validates :phone, :presence => true

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, :presence => true,
                    :uniqueness => { :case_sensitive => false },
                    :confirmation => true,
                    :on => :create,
                    :format => { :with => email_regex }
  has_many :offices
  has_many :menus

  def to_param
    "#{id} #{name}".parameterize
  end
end
