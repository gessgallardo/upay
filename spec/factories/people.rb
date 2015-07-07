# spec/factories/person.rb

require 'faker'

FactoryGirl.define do
  
  factory :people_person, class: Upay::People::Person do |f|
    f.fullName{ Faker::Name.name}
    f.emailAddress{ Faker::Internet.email }
    f.contactPhone{ Faker::Number.number(10) }
  end

  factory :people_buyer, class: Upay::People::Buyer do |f|
    person = FactoryGirl.build(:people_person)

    f.fullName{ person.fullName}
    f.emailAddress{ person.emailAddress}
    f.contactPhone{ person.contactPhone }
  end

  factory :people_payer, class: Upay::People::Payer do |f|
    person = FactoryGirl.build(:people_person)

    f.fullName{ person.fullName}
    f.emailAddress{ person.emailAddress}
    f.contactPhone{ person.contactPhone }
  end

end