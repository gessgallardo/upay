# spec/factories/plan.rb

require 'faker'

FactoryGirl.define do
  
  factory :plan, class: Upay::Plan do |f|
    p_value = Faker::Number.number(5)
    f.accountId{ Faker::Number.number(6)}
    f.planCode{ Faker::Code.isbn}
    f.description{ Faker::Lorem.sentence(3, true, 4) }
    f.interval{ "MONTH" }
    f.intervalCount{ Faker::Number.digit }
    f.value{ p_value}
    f.currency{ "COP" }
    f.additionalValues{
      [{
        name: "PLAN_VALUE",
        value: p_value,
        currency: "COP"
      }]
    }
    f.trialDays{ Faker::Number.digit }
  end

end