FactoryGirl.define do
  factory :story do
    hn_id { generate(:hn_id) }
    published_at { Time.now }
    sequence :title { |n| "Who is hiring #{n}" }
  end
end
