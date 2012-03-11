require 'spec_helper'

describe Customer do

  before(:each) do
    @attr = {
      :first_name => 'John',
      :last_name => 'Papa',
      :email => 'email@email.com',
      :email_confirmation => 'email@email.com',
      :phone => 12345678,
      :password => 'abc1234',
      :password_confirmation => 'abc1234'
    }
  end

  it "should create a new instance given valid attributes" do
    Customer.create!(@attr)
  end

  it "should be valid when create new customer" do
    customer = Customer.create(@attr)
    customer.should be_valid
  end

  it 'should protect id attribute and generate its own' do
    customer = Customer.create(@attr.merge(:id => 999))
    customer.id.should eq(customer.id)
  end

  it "should accept valid email addresses" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
      valid_email_customer = Customer.new(@attr.merge(:email => address, :email_confirmation => address))
      valid_email_customer.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_customer = Customer.new(@attr.merge(:email => address, :email_confirmation => address))
      invalid_email_customer.should_not be_valid
    end
  end

  it "should validate email confirmation when they do not match" do
    customer = Customer.new
    customer.email = 'foo@bar.com'
    customer.email_confirmation = 'ab@cd.com'
    customer.should_not be_valid
  end

  it "should validate email given empty email" do
    customer = Customer.new
    customer.email = ''
    customer.should_not be_valid
  end

  it "should reject duplicate email addresses" do
    Customer.create!(@attr)
    customer_with_duplicate_email = Customer.new(@attr)
    customer_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    Customer.create!(@attr.merge(:email => upcased_email, :email_confirmation => upcased_email))
    customer_with_duplicate_email = Customer.new(@attr)
    customer_with_duplicate_email.should_not be_valid
  end

  it 'should reject passwords that are too long' do
    long_password = 'a' * 31
    long_password_customer = Customer.new(@attr.merge(:password => long_password))
    long_password_customer.should_not be_valid
  end

  it 'should reject passwords that are too short' do
    short_password = '123'
    short_password_customer = Customer.new(@attr.merge(:password => short_password))
    short_password_customer.should_not be_valid
  end

end