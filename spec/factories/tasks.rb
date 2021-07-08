FactoryBot.define do
  factory :task do
    name { "MyString" }
    description { "MyText" }
    due_date { "2021-05-31" }
    category
  end
end
