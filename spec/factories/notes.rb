FactoryBot.define do
  factory :note do
    body { "MyText" }
    user { nil }
    task { nil }
  end
end
