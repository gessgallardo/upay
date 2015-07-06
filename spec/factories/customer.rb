# spec/factories/customers.rb

require 'faker'

FactoryGirl.define do
  factory :customer do |f|
    f.fullName { Faker::Name.name }
    f.email {Faker::Internet.email}
  end
end