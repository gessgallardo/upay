# spec/factories/shipping_address.rb

require 'faker'

FactoryGirl.define do
  
  factory :shipping_address, class: Upay::ShippingAddress do |f|
    f.street1{ Faker::Address.street_address }
    f.street2{ Faker::Address.secondary_address }
    f.city{ Faker::Address.city }
    f.state{ Faker::Address.state }
    f.country{ Faker::Address.country_code}
    f.postalCode{ Faker::Address.zip_code }
    f.phone{ Faker::Number.number(10) }
  end
end