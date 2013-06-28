# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :teacher do
    sequence(:name) { |n| "teacher #{n}" }
  end
end
