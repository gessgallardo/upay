require 'spec_helper'

describe Upay::People::Buyer do
  it "has a valid factory" do
    pep_buyer = FactoryGirl.build(:people_buyer)
    expect(pep_buyer).to be_valid
  end

  it "is invalid without a fullName" do
    pep_buyer = FactoryGirl.build(:people_buyer, fullName: nil)
    expect(pep_buyer).not_to be_valid
  end

  it "is invalid without a emailAddress" do
    pep_buyer = FactoryGirl.build(:people_buyer, emailAddress: nil)
    expect(pep_buyer).not_to be_valid
  end

end