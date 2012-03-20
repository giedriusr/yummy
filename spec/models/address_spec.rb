require 'spec_helper'

describe Address do

  before(:each) do
    mock_geocoding!
    @attr = {
      :address => 'kallithea',
      :post_code => 17671,
      :country_code => 'GR',
      :city => 'athens',
      :longitude => 20,
      :latitude => 21
    }
  end

  it 'should create a new instance given valid attributes' do
    Address.create!(@attr)
  end

  it 'should be valid when create new address' do
    delivery_address = Address.create(@attr)
    delivery_address.should be_valid
  end

  it 'should not be valid when country_code is longer than 2 chars' do
    delivery_address = Address.create(@attr.merge(:country_code => 'LTU'))
    delivery_address.should_not be_valid
  end

  it 'should not be valid when country_code is shorter than 2 chars' do
    delivery_address = Address.create(@attr.merge(:country_code => 'L'))
    delivery_address.should_not be_valid
  end

  it 'should protect customer_id attribute' do
    expect { Address.create(@attr.merge(:customer_id => 1)) }.to raise_error('Can\'t mass-assign protected attributes: customer_id')
  end
end