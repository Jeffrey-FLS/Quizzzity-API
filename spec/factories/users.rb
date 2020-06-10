FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name { "Doe" }
    email { "john_doe@example.com" }
    username { "johnD7" }
    password { "JD123456" }
  end

  factory :random_user, class: User do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.safe_email }
    username { Faker::Internet.user_name }
    password { Faker::Internet.password }
  end
end