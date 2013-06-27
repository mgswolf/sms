require 'faker'
puts '---Cleaning DataBase --'
[SchoolClass].map(&:delete_all)

# School Classes
puts '---Creating School Classes ---'
SCHOLL_CLASSES = []

File.open("#{Rails.root}/db/seeds/classes.yml") do |scholl_class|
  scholl_class.read.each_line do |name|
    SCHOLL_CLASSES << name
  end
end
10.times { FactoryGirl.create(:school_class, name: SCHOLL_CLASSES.sample) }
