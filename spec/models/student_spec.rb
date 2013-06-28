require 'spec_helper'

describe Student do
  let(:school_class) { FactoryGirl.create(:school_class) }
  let(:student) { FactoryGirl.build(:student, school_class: school_class) }
  subject { student }

  it { should be_valid }
  it { should respond_to(:school_class) }
  it { should respond_to(:teachers) }

  describe "have a name" do
    before { student.name = nil }
    it { should_not be_valid}
  end

  it "belongs to a scholl class" do
    expect(student.school_class).to eql(school_class)
  end

  describe "needs a school class" do
    before { student.school_class = nil }
    it { should_not be_valid }
  end

  it "have name_n_school_class" do
    composed_name = "#{student.name} - #{school_class.name}"
    expect(student.name_n_school_class).to eql(composed_name)
  end

  it "have a teacher" do
    teacher = FactoryGirl.create(:teacher)
    school_class.teachers << teacher
    expect(student.teachers).to include(teacher)
  end
end
