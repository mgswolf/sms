# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :school_class do
    sequence(:name) { |n| "SchoolClassName#{n}" }
  end
end
