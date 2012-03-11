require 'spec_helper'

describe Provider do

  before(:each) do
    mock_geocoding!
    @attr = {
      :email => "user@example.com",
      :name => 'name',
      :password => "foobar",
      :phone => 1234567890,
    }
  end

  it "should create a new instance given valid attributes" do
    Provider.create!(@attr)
  end

  it "should be valid when create new provider" do
    provider = Provider.create(@attr)
    provider.should be_valid
  end

  it 'should protect id attribute and generate its own' do
    provider = Provider.create(@attr.merge(:id => 999))
    provider.id.should eq(provider.id)
  end

  it "should accept valid email addresses" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
      valid_email_provider = Provider.new(@attr.merge(:email => address))
      valid_email_provider.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_provider = Provider.new(@attr.merge(:email => address))
      invalid_email_provider.should_not be_valid
    end
  end

  it "should validate email confirmation when they do not match" do
    provider = Provider.new
    provider.email = 'foo@bar.com'
    provider.email_confirmation = 'ab@cd.com'
    provider.should_not be_valid
  end

  it "should validate email given empty email" do
    provider = Provider.new
    provider.email = ''
    provider.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_user = Provider.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end

  it "should reject duplicate email addresses" do
    # Put a user with given email address into the database.
    Provider.create!(@attr)
    provider_with_duplicate_email = Provider.new(@attr)
    provider_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    Provider.create!(@attr.merge(:email => upcased_email))
    provider_with_duplicate_email = Provider.new(@attr)
    provider_with_duplicate_email.should_not be_valid
  end

  it 'should reject passwords that are too long' do
    long_password = 'a' * 31
    long_password_provider = Provider.new(@attr.merge(:password => long_password))
    long_password_provider.should_not be_valid
  end

  it 'should reject passwords that are too short' do
    short_password = '123'
    short_password_provider = Provider.new(@attr.merge(:password => short_password))
    short_password_provider.should_not be_valid
  end

  it 'should return list of offices for current provider' do
    provider = Provider.create(@attr)
    office_one = provider.offices.build(:name => 'foo')
    office_two = provider.offices.build(:name => 'bar')
    office_three = provider.offices.build(:name => 'baz')
    provider.save
    provider.offices.length.should eq(3)
    provider.offices.first.name.should eq('foo')
    provider.offices.last.should equal(office_three)
  end

  it 'should return list of menus for current provider' do
    provider = Provider.create(@attr)
    menu_one = provider.menus.build(:name => 'pizza')
    menu_two = provider.menus.build(:name => 'drinks')
    provider.save
    provider.menus.length.should eq(2)
    provider.menus.first.name.should eq('pizza')
  end

  it 'should parametirize when url generated for ID' do
      provider = Provider.create(@attr.merge(:name => 'tsom'))
      provider.to_param.should eq("#{provider.id}-tsom")
  end

end
