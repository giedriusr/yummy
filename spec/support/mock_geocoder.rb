# In spec_helper:
# RSpec.configure do |config|
# ...
# config.include(MockGeocoder)
# end
#
# In your tests:
# it 'mock geocoding' do
# mock_geocoding! # You may pass additional params to override defaults (i.e. :coordinates => [10, 20])
# address = Factory(:address)
# address.lat.should eq(1)
# address.lng.should eq(2)
# end

require 'geocoder/results/base'

module MockGeocoder
  def self.included(base)
    base.before :each do
      ::Geocoder.stub(:search).and_raise(RuntimeError.new 'Use "mock_geocoding!" method in your tests.')
    end
  end

  def mock_geocoding!(options = {})
    options.reverse_merge!(:address => 'saripolou 10', :coordinates => [17.321, 18.999], :country_code => 'Country code')

    MockResult.new.tap do |result|
      result.stub options
      Geocoder.stub :search => [result]
    end
  end

  class MockResult < ::Geocoder::Result::Base
    def initialize(data = [])
      super(data)
    end
  end
end