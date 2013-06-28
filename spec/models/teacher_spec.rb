require 'spec_helper'

describe Teacher do
  let(:teacher) { FactoryGirl.build(:teacher) }
  subject { teacher }

  it { should be_valid }
  it { should respond_to(:school_classes) }
  it { should respond_to(:students) }
  it { should respond_to(:evaluations) }

  describe "have a name" do
    before { teacher.name = nil }
    it { should_not be_valid }
  end

  describe "work on scholl classes" do
    before do
      teacher.save
      2.times { teacher.school_classes << FactoryGirl.create(:school_class) }
    end

    it "have 2 scholl classes" do
      expect(teacher.school_classes.size).to eql(2)
    end
  end

  describe "have students" do
    before do
      teacher.save
      school_class = FactoryGirl.create(:school_class)
      @joe = school_class.students.create(name: 'Joe')
      @mary = school_class.students.create(name: 'Mary')
      teacher.school_classes << school_class
    end

    it "have 2 student through the scholl class" do
      expect(teacher.students.size).to eql(2)
    end

    describe "have evaluations" do
      date = Time.now.to_date
      before do
        teacher.evaluations.create(student_id: @joe.id, title: 'joe avaliation',
                                    grade: '9', evaluation_date: date)
        teacher.evaluations.create(student_id: @mary.id, title: 'mary avaliation',
                                    grade: '9.5', evaluation_date: date)
      end

      it "returns 2 evaluations" do
        expect(teacher.evaluations.size).to eql(2)
      end
    end
  end




end
