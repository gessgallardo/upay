# spec/factories/order.rb

require 'faker'

FactoryGirl.define do
  
  factory :order, class: Upay::Order do |f|
    f.referenceCode{ Faker::Number.number(10) }
    f.description{ Faker::Commerce.product_name }
    f.signature{ Faker::Number.number(10) }
    f.buyer{ FactoryGirl.build(:people_buyer) }
  end
end