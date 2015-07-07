require 'spec_helper'

describe Upay::People::Person do
  it "has a valid factory" do
    pep_person = FactoryGirl.build(:people_person)
    expect(pep_person).to be_valid
  end

  it "is invalid without a fullName" do
    pep_person = FactoryGirl.build(:people_person, fullName: nil)
    expect(pep_person).not_to be_valid
  end

  it "is invalid without a emailAddress" do
    pep_person = FactoryGirl.build(:people_person, emailAddress: nil)
    expect(pep_person).not_to be_valid
  end

end