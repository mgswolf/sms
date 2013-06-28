# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :evaluation do
    student nil
    teacher nil
    grade "9.99"
    evaluation_date "2013-06-28"
    title "MyString"
  end
end
