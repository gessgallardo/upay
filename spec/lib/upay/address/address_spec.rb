# spec/models/address.rb
require 'spec_helper'

describe Upay::Address::Address do
  it "has a valid factory" do
    ship_address = FactoryGirl.build(:address)
    expect(ship_address).to be_valid
  end

  it "is invalid without a street1" do
    ship_address = FactoryGirl.build(:address, street1: nil)
    expect(ship_address).to_not be_valid
  end

  it "is invalid without a city" do
    ship_address = FactoryGirl.build(:address, city: nil);
    expect(ship_address).to_not be_valid
  end

  it "is invalid without a state" do
    ship_address = FactoryGirl.build(:address, state: nil);
    expect(ship_address).to_not be_valid
  end

  it "is invalid without a country" do
    ship_address = FactoryGirl.build(:address, country: nil);
    expect(ship_address).to_not be_valid
  end

  it "is invalid without a postalCode" do
    ship_address = FactoryGirl.build(:address, postalCode: nil);
    expect(ship_address).to_not be_valid
  end
end