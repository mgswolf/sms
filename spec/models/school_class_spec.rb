require 'spec_helper'

describe SchoolClass do
  let(:school_class) { FactoryGirl.build(:school_class) }
  subject { school_class }

  it { should be_valid }
  it { should respond_to(:students) }
  #it { should respond_to(:teachers) }

  describe "have a name" do
    before { school_class.name = nil }
    it { should_not be_valid }
  end

  describe "have students" do
    before do
      school_class.save
      school_class.students.create(name: 'Joe')
    end

    it "have 1 student after create" do
      expect(school_class.students.size).to eql(1)
    end
  end
end
