require 'spec_helper'

describe Item do

  before(:each) do
    @attr = {
      :name => 'cola',
      :price => 1.5
    }
  end

  it 'should create a new instance given valid attributes' do
    Item.create!(@attr)
  end

  it 'should be valid when create new item' do
    menu = Item.create(@attr)
    menu.should be_valid
  end

  it 'should protect provider_id attribute' do
    expect { Item.create(@attr.merge(:provider_id => 1)) }.to raise_error('Can\'t mass-assign protected attributes: provider_id')
  end

  it 'should return provider of current item' do
    provider = Provider.create({:email => "user@example.com", :name => 'parent provider',
                                :password => "foobar", :phone => 1234567890,})

    item = provider.items.build(:name => 'cola')
    provider.save
    item.provider.name.should eq('parent provider')
  end

end