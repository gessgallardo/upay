
require 'spec_helper'

describe Upay::Customers do
  it "has a valid factory" do
    FactoryGirl.create(:customers)
  end

  it "is invalid without a fullName" 
  it "is invalid without a email"
end