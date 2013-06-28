require 'faker'
puts '---Cleaning DataBase --'
[SchoolClass, Student].map(&:delete_all)

# School Classes
puts '---Creating School Classes ---'
SCHOLL_CLASSES = []

File.open("#{Rails.root}/db/seeds/classes.yml") do |scholl_class|
  scholl_class.read.each_line do |name|
    SCHOLL_CLASSES << name
  end
end
school_classes = []
10.times do
  school_classes << FactoryGirl.create(:school_class, name: SCHOLL_CLASSES.sample)
end

# Students
puts '---Creating Students ---'
50.times do
  FactoryGirl.create(:student, {
      name: Faker::Name.name,
      school_class: school_classes.sample
    })
end

# Teachers
puts '---Creating Teachers ---'
10.times do
  FactoryGirl.create(:teacher, {
    name: Faker::Name.name
    })
end