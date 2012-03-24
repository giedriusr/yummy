class Office < ActiveRecord::Base

  attr_accessible :name, :city, :country_code, :phone,
                  :longitude, :latitude, :email, :address, :post_code,
                  :description

  validates :name, :city, :country_code, :phone, :email, :address, :post_code,
            :description, :presence => true

  validates :country_code, :length => { :is => 2 }

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :format => { :with => email_regex }

  geocoded_by :address
  after_validation :geocode

  belongs_to :provider

  def self.valid_offices(providers, ip)
    valid_offices = []
    near_offices = self.near(ip, 10)

    providers.each do |provider|
      poffices = provider.offices
      poffices.each do |office|
        near_offices.each do |near_office|
          if near_office.id == office.id
            valid_offices << near_office
          end
        end
      end
    end
    valid_offices
  end

end
