require 'spec_helper'

describe Student do
  let(:school_class) { FactoryGirl.create(:school_class) }
  let(:student) { FactoryGirl.build(:student, school_class: school_class) }
  subject { student }

  it { should be_valid }
  it { should respond_to(:school_class) }
  #it { should respond_to(:teachers) }

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
end
