FactoryBot.define do
  factory :video do
    user
    sequence(:title)        { |n| "title No.#{n}"}
    sequence(:tag_list)     { |n| "tag#{n}-1,tag#{n}-2,tag#{n}-3"}
    sequence(:youtube_url)  { |n| "https://www.youtube.com/watch?v=123Abc_deF#{n}"}
    created_at              { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
  end
end
