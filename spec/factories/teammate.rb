FactoryGirl.define do
  factory :teammate do
    office "NYC"
    name Faker::Name.name
    title Faker::Name.title
    team Faker::Company.catch_phrase
    image "images/image.jpg"
  end
end
