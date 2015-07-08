# spec/factories/token.rb

require 'faker'

FactoryGirl.define do
  
  factory :token, class: Upay::Token do |f|
    f.payerId{ Faker::Number.number(5)}
    f.name{ Faker::Name.name }
    f.identificationNumber{ Faker::Number.number(10) }
    f.paymentMethod{ Faker::Business.credit_card_type }
    f.number{ Faker::Business.credit_card_number.gsub("-", "") }
    f.expirationDate{
      date = Faker::Business.credit_card_expiry_date.strftime("%m/%Y").split("/")
      "#{date.last}/#{date.first}"
    }
  end
end