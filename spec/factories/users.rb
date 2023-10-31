FactoryBot.define do
  factory :user do
    name { 'example_user' }
    description { 'description 1' }
    photo { 'description 1' }
    bio { 'description 1' }
    posts_counter { 1 }
  end
end
