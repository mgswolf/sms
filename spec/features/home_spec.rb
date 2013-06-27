require 'spec_helper'

describe "Home" do
  before do
    6.times do
      school_class = FactoryGirl.create(:school_class)
      FactoryGirl.create(:student, school_class: school_class)
    end
    ensure_on root_path
   end
   subject { page }

   it { should have_content(SchoolClass.last.name) }
   it { should have_content(Student.last.name) }

   it { should_not have_content(SchoolClass.first.name) }
   it { should_not have_content(Student.first.name) }
end