require 'spec_helper'

describe Upay::People::Payer do
  it "has a valid factory" do
    pep_payer = FactoryGirl.build(:people_payer)
    expect(pep_payer).to be_valid
  end

  it "is invalid without a fullName" do
    pep_payer = FactoryGirl.build(:people_payer, fullName: nil)
    expect(pep_payer).not_to be_valid
  end

  it "is invalid without a emailAddress" do
    pep_payer = FactoryGirl.build(:people_payer, emailAddress: nil)
    expect(pep_payer).not_to be_valid
  end

end