require 'spec_helper'

describe Office do

  before(:each) do
    mock_geocoding!
    @attr = {
      :email => "office@example.com",
      :name => 'headquaters',
      :phone => '123-call-me',
      :description => 'main office, headquaters',
      :address => 'evangelistrias 36',
      :post_code => 17671,
      :city => 'Athens',
      :country_code => 'GR'
    }
  end

  it 'should create a new instance given valid attributes' do
    Office.create!(@attr)
  end

  it 'should be valid when create new office' do
    office = Office.create(@attr)
    office.should be_valid
  end

  it 'should not be valid when country_code is longer than 2 chars' do
    office = Office.create(@attr.merge(:country_code => 'LTU'))
    office.should_not be_valid
  end

  it 'should not be valid when country_code is shorter than 2 chars' do
    office = Office.create(@attr.merge(:country_code => 'L'))
    office.should_not be_valid
  end

  it 'should protect provider_id attribute' do
    expect { Office.create(@attr.merge(:provider_id => 1)) }.to raise_error('Can\'t mass-assign protected attributes: provider_id')
  end

  it "should accept valid email addresses" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
      valid_email_office = Office.new(@attr.merge(:email => address))
      valid_email_office.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_office = Office.new(@attr.merge(:email => address))
      invalid_email_office.should_not be_valid
    end
  end

  it "should validate email given empty email" do
    office = Office.new
    office.email = ''
    office.should_not be_valid
  end

  it 'should return provider of current office' do
    provider = Provider.create({:email => "user@example.com", :name => 'parent provider',
                                :password => "foobar", :phone => 1234567890,})

    office = provider.offices.build(:name => 'foo')
    provider.save
    office.provider.name.should eq('parent provider')
  end

  it 'should update longitude and latitude after changing the address' do
    office = Office.create(@attr)
    office.latitude.should eq(17.321)
    office.longitude.should eq(18.999)
  end

end