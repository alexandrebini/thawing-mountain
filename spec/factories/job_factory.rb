FactoryGirl.define do
  factory :job do
    story
    hn_id { generate(:hn_id) }
    published_at { Time.now }
    text { Faker::Lorem.paragraph }
    user { Faker::Internet.slug }
  end
end
