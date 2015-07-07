require 'spec_helper'

describe Upay::Order do
  it "has a valid factory" do
    ord = FactoryGirl.build(:order)
    expect(ord).to be_valid
  end

  it "is invalid without a referenceCode" do
    ord = FactoryGirl.build(:order, referenceCode: nil)
    expect(ord).not_to be_valid
  end

  it "is invalid without a description" do
    ord = FactoryGirl.build(:order, description: nil)
    expect(ord).not_to be_valid
  end

  it "is invalid without a signature" do
    ord = FactoryGirl.build(:order, signature: nil)
    expect(ord).not_to be_valid
  end

  it "is invalid without a buyer" do
    ord = FactoryGirl.build(:order, buyer: {})
    expect(ord).not_to be_valid
  end
end

