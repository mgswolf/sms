# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student do
    sequence(:name) {|n| "STUDENT NAME #{n}" }
    school_class nil
  end
end
