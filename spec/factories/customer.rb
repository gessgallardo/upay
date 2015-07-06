# spec/factories/customer.rb

require 'faker'

FactoryGirl.define do
  
  factory :customer, class: Upay::Customer do |f|
    f.fullName { Faker::Name.name }
    f.email {Faker::Internet.email}
  end

end