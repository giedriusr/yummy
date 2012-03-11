require 'spec_helper'

describe Order do

  before(:each) do
    # mock_geocoding!
    @attr = {
      :status => 'completed'
    }
  end

  it 'should create a new instance given valid attributes' do
    Order.create!(@attr)
  end

  it 'should be valid when create new order' do
    order = Order.create(@attr)
    order.should be_valid
  end

  it 'should protect customer_id attribute' do
    expect { Order.create(@attr.merge(:customer_id => 1)) }.to raise_error('Can\'t mass-assign protected attributes: customer_id')
  end

  it 'should protect delivery_address_id attribute' do
    expect { Order.create(@attr.merge(:delivery_address_id => 1)) }.to raise_error('Can\'t mass-assign protected attributes: delivery_address_id')
  end
end