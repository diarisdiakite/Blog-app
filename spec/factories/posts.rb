FactoryBot.define do
  factory :post do
    # id { 1 }
    title { 'example_title' }
    comments_counter { 1 }
    likes_counter { 1 }
    association :author, factory: :user
  end
end
