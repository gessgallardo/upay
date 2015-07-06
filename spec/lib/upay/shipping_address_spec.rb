# spec/models/contact.rb
require 'spec_helper'

describe Upay::ShippingAddress do
  it "has a valid factory" do
    address = FactoryGirl.build(:shipping_address)
    expect(address).to be_valid
  end
  
  it "is invalid without a street address" do
    pending "WIP"
    address = FactoryGirl.build(:shipping_address, :street1)
    expect(address).not_to be_valid
  end
  
  it "is invalid without a city" do
    pending "WIP"
    address = FactoryGirl.build(:shipping_address, :city)
    expect(address).not_to be_valid
  end
  
  it "is invalid without a state" do
    pending "WIP"
    address = FactoryGirl.build(:shipping_address, :state)
    expect(address).not_to be_valid
  end
  
  it "is invalid without a country" do
    pending "WIP"
    address = FactoryGirl.build(:shipping_address, :country)
    expect(address).not_to be_valid
  end
  
  it "is invalid without a postalCode" do
    pending "WIP"
    address = FactoryGirl.build(:shipping_address, :postalCode)
    expect(address).not_to be_valid
  end
end