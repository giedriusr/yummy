require 'spec_helper'

describe "index/index.html.erb" do
  it 'renders search form with 2 fields' do
    render
    rendered.should have_selector("input[name='wish']")
    rendered.should have_selector("input[name='address']")
  end
end
