FactoryBot.define do
  factory :ticket do
    name { "MyString" }
    option { 1 }
    amount { 1 }
    event { nil }
  end
end
