# spec/factories/credit_card.rb

require 'faker'

FactoryGirl.define do
  
  factory :credit_card, class: Upay::CreditCard do |f|
    f.name { Faker::Name.name }
    f.document{ Faker::Number.number(10) }
    f.number{ Faker::Number.number(10) }
    f.expMonth{
      date = Faker::Business.credit_card_expiry_date.strftime("%m/%Y").split("/")
      date.first
    }
    f.expYear{
      date = Faker::Business.credit_card_expiry_date.strftime("%m/%Y").split("/")
      date.last
    }
    f.type{ Faker::Business.credit_card_type }
  end

end