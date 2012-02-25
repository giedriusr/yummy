require 'spec_helper'

describe IndexController do
  render_views

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "should have content about introduction" do
      get 'index'
      response.body.should include("homepage")
    end
  end

end
