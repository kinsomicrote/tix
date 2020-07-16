FactoryBot.define do
  factory :inactive_event do
    date { "2020-07-16" }
    event { nil }
  end
end
