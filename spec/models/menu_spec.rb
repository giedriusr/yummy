require 'spec_helper'

describe Menu do

  before(:each) do
    @attr = {
      :name => 'pizza',
      :photo => 'foo.jpg'
      }
  end

  it 'should create a new instance given valid attributes' do
    Menu.create!(@attr)
  end

  it 'should be valid when create new menu' do
    menu = Menu.create(@attr)
    menu.should be_valid
  end

  it 'should protect provider_id attribute' do
    expect { Menu.create(@attr.merge(:provider_id => 1)) }.to raise_error('Can\'t mass-assign protected attributes: provider_id')
  end

end