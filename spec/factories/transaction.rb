# spec/factories/transaction.rb

require 'faker'

FactoryGirl.define do
  factory :transaction, class: Upay::Transaction do |f|
    f.creditCardTokenId{ Faker::Internet.password(10, 20) }
    f.cookie{ Faker::Internet.password(10, 20) }
    f.deviceSessionId{ Faker::Internet.password(10, 20) }
    f.order{ FactoryGirl.build(:order) }
    f.payer{ FactoryGirl.build(:people_payer) }
    f.paymentCountry{ Faker::Address.country_code }
    f.paymentMethod{ Faker::Business.credit_card_type.upcase }
    f.type{ "AUTHORIZATION_AND_CAPTURE" }
  end
end