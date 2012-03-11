require 'spec_helper'

describe Ingredient do

  before(:each) do
    @attr = {
      :name => 'peppers'
    }
  end

  it 'should create a new instance given valid attributes' do
    Ingredient.create!(@attr)
  end

  it 'should be valid when create new ingredient' do
    menu = Ingredient.create(@attr)
    menu.should be_valid
  end

  it 'should protect provider_id attribute' do
    expect { Ingredient.create(@attr.merge(:provider_id => 1)) }.to raise_error('Can\'t mass-assign protected attributes: provider_id')
  end

  it 'should return provider of current ingredient' do
    provider = Provider.create({:email => "user@example.com", :name => 'parent provider',
                                :password => "foobar", :phone => 1234567890,})

    ingredient = provider.ingredients.build(:name => 'cola')
    provider.save
    ingredient.provider.name.should eq('parent provider')
  end
end