require 'spec_helper'

describe Upay::Customer do
  it "has a valid factory" do
    customer = FactoryGirl.build(:customer)
    expect(customer).to be_valid
  end
  
  it "is invalid without a fullName" do
    customer = FactoryGirl.build(:customer, fullName: nil)
    expect(customer).not_to  be_valid
  end

  it "is invalid without a email" do
    customer = FactoryGirl.build(:customer, email: nil)
    expect(customer).not_to  be_valid
  end
end