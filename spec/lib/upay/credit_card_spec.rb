require 'spec_helper'
require 'upay'

describe Upay::CreditCard do
  it "has a valid factory" do
    customer = FactoryGirl.build(:credit_card)
    expect(customer).to be_valid
  end
  
  it "is invalid without a name" do
    customer = FactoryGirl.build(:credit_card, name: nil)
    expect(customer).not_to  be_valid
  end

  it "is invalid without a document" do
    customer = FactoryGirl.build(:credit_card, document: nil)
    expect(customer).not_to  be_valid
  end

  it "is invalid without a number" do
    customer = FactoryGirl.build(:credit_card, number: nil)
    expect(customer).not_to  be_valid
  end

  it "is invalid without a expMonth" do
    customer = FactoryGirl.build(:credit_card, expMonth: nil)
    expect(customer).not_to  be_valid
  end

  it "is invalid without a expYear" do
    customer = FactoryGirl.build(:credit_card, expYear: nil)
    expect(customer).not_to  be_valid
  end

  it "is invalid without a type" do
    customer = FactoryGirl.build(:credit_card, type: nil)
    expect(customer).not_to  be_valid
  end
end