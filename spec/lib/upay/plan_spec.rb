require 'spec_helper'
require 'upay'

describe Upay::Plan do
  it "has a valid factory" do
    plan = FactoryGirl.build(:plan)
    expect(plan).to be_valid
  end
  
  it "is invalid without a accountId" do
    plan = FactoryGirl.build(:plan, accountId: nil)
    expect(plan).not_to  be_valid
  end

  it "is invalid without a planCode" do
    plan = FactoryGirl.build(:plan, planCode: nil)
    expect(plan).not_to  be_valid
  end

  it "is invalid without a description" do
    plan = FactoryGirl.build(:plan, description: nil)
    expect(plan).not_to  be_valid
  end

  it "is invalid without a interval" do
    plan = FactoryGirl.build(:plan, interval: nil)
    expect(plan).not_to  be_valid
  end

  it "is invalid without a value" do
    plan = FactoryGirl.build(:plan, value: nil)
    expect(plan).not_to  be_valid
  end

  it "is invalid without a currency" do
    plan = FactoryGirl.build(:plan, currency: nil)
    expect(plan).not_to  be_valid
  end

  it "is invalid without a intervalCount" do
    plan = FactoryGirl.build(:plan, intervalCount: nil)
    expect(plan).not_to  be_valid
  end

  it "is invalid without a additionalValues" do
    plan = FactoryGirl.build(:plan, additionalValues: nil)
    expect(plan).not_to  be_valid
  end

  it "is invalid without a trialDays" do
    plan = FactoryGirl.build(:plan, trialDays: nil)
    expect(plan).not_to  be_valid
  end
end