require 'spec_helper'

describe Upay::Token do
  it "has a valid factory" do
    tok = FactoryGirl.build(:token)
    expect(tok).to be_valid
  end
  
  it "is invalid without a name" do
    tok = FactoryGirl.build(:token, name: nil)
    expect(tok).not_to be_valid
  end

  it "is invalid without a identificationNumber" do
    tok = FactoryGirl.build(:token, identificationNumber: nil)
    expect(tok).not_to be_valid
  end

  it "is invalid without a paymentMethod" do
    tok = FactoryGirl.build(:token, paymentMethod: nil)
    expect(tok).not_to be_valid
  end

  it "is invalid without a number" do
    tok = FactoryGirl.build(:token, number: nil)
    expect(tok).not_to be_valid
  end

  it "is invalid without a expirationDate" do
    tok = FactoryGirl.build(:token, expirationDate: nil)
    expect(tok).not_to be_valid
  end
end