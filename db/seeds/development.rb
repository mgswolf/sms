require 'faker'
puts '---Cleaning DataBase --'
[SchoolClass, Student, Teacher, Evaluation].map(&:delete_all)

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
students = []
50.times do
  students << FactoryGirl.create(:student, {
      name: Faker::Name.name,
      school_class: school_classes.sample
    })
end

# Teachers
puts '---Creating Teachers ---'
teachers = []
10.times do
  teacher = FactoryGirl.create(:teacher, {
    name: Faker::Name.name
    })
  teacher.school_classes << school_classes.sample
  teachers << teacher
end

#Evaluations
puts '---Creating Evaluations ---'
30.times do
  FactoryGirl.create(:evaluation, {
      title: Faker::Lorem.words(2),
      teacher: teachers.sample,
      student: students.sample,
      grade: rand(0.1..10)
    })
end