FactoryGirl.define do
  factory :post do

    body {Faker::Hacker.say_something_smart}
    title {Faker::Hacker.verb + Faker::Hacker.adjective + Faker::Hacker.noun}
    user {create :user}
    image {Faker::Avatar.image}
  end
end
