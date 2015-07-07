# spec/models/billing_address.rb
require 'spec_helper'

describe Upay::Address::BillingAddress do
  it "has a valid factory" do
    ship_address = FactoryGirl.build(:billing_address)
    expect(ship_address).to be_valid
  end

  it "is invalid without a street1" do
    ship_address = FactoryGirl.build(:billing_address, street1: nil)
    expect(ship_address).to_not be_valid
  end

  it "is invalid without a city" do
    ship_address = FactoryGirl.build(:billing_address, city: nil);
    expect(ship_address).to_not be_valid
  end

  it "is invalid without a state" do
    ship_address = FactoryGirl.build(:billing_address, state: nil);
    expect(ship_address).to_not be_valid
  end

  it "is invalid without a country" do
    ship_address = FactoryGirl.build(:billing_address, country: nil);
    expect(ship_address).to_not be_valid
  end

  it "is invalid without a postalCode" do
    ship_address = FactoryGirl.build(:billing_address, postalCode: nil);
    expect(ship_address).to_not be_valid
  end
end