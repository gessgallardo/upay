require 'spec_helper'

describe Upay::Transaction do
  it "has a valid factory" do
    tran = FactoryGirl.build(:transaction)
    expect(tran).to be_valid
  end

  it "it is invalid without an order" do
    tran = FactoryGirl.build(:transaction, order: nil)
    expect(tran).not_to be_valid
  end

  it "it is invalid without a payer" do
    tran = FactoryGirl.build(:transaction, payer: nil)
    expect(tran).not_to be_valid
  end

  it "is invalid without a creditCardTokenId" do
    tran = FactoryGirl.build(:transaction, creditCardTokenId: nil)
    expect(tran).not_to be_valid
  end

  it "is invalid without a type" do
    tran = FactoryGirl.build(:transaction, type: nil)
    expect(tran).not_to be_valid
  end 

  it "is invalid without a paymentMethod" do
    tran = FactoryGirl.build(:transaction, paymentMethod: nil)
    expect(tran).not_to be_valid
  end

  it "is invalid without a paymentCountry" do
    tran = FactoryGirl.build(:transaction, paymentCountry: nil)
    expect(tran).not_to be_valid
  end

end