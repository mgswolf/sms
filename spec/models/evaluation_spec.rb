require 'spec_helper'

describe Evaluation do
  let(:teacher) { FactoryGirl.create(:teacher) }
  let(:school_class) { FactoryGirl.create(:school_class)}
  let(:student) { FactoryGirl.create(:student, school_class: school_class) }
  let(:evaluation) { FactoryGirl.build(:evaluation, teacher: teacher, student: student) }
  subject { evaluation }

  it { should be_valid }
  it { should respond_to(:teacher) }
  it { should respond_to(:student)}

  describe "have a grade" do
    before { evaluation.grade = nil }
    it { should_not be_valid }
  end

  describe "grade should be a number" do
    before { evaluation.grade = 'string' }
    it { should_not be_valid }
  end

  it "belongs to a teacher" do
    expect(evaluation.teacher).to eql(teacher)
  end

  it "belongs to a student" do
    expect(evaluation.student).to eql(student)
  end

  describe "needs a teacher" do
    before { evaluation.teacher = nil }
    it { should_not be_valid }
  end

  describe "needs a student" do
    before { evaluation.student = nil }
    it { should_not be_valid }
  end
end
