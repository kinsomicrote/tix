FactoryBot.define do
  factory :event do
    name { "MyString" }
    description { "MyText" }
    start_date { "2020-07-15 21:32:56" }
    end_date { "2020-07-15 21:32:56" }
    user { nil }
  end
end
