require 'spec_helper'

describe Student do
  let(:school_class) { FactoryGirl.create(:school_class) }
  let(:student) { FactoryGirl.build(:student, school_class: school_class) }
  let(:saved_student) { FactoryGirl.create(:student, school_class: school_class) }
  let(:teacher) { FactoryGirl.create(:teacher) }
  subject { student }

  it { should be_valid }
  it { should respond_to(:school_class) }
  it { should respond_to(:teachers) }
  it { should respond_to(:evaluations) }

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

  describe "have evaluations" do
    before do
      school_class.teachers << teacher
      2.times { teacher.evaluations.create(student_id: saved_student.id,grade: 6) }
    end

    it "returns 2 evaluations" do
      expect(saved_student.evaluations.size).to eql(2)
    end

    it "sum all grades" do
      expect(saved_student.sum_grades).to eql(12)
    end

    it "has a Average Grade" do
      expect(saved_student.average_grade).to eql(6)
    end

    it "returns pending avaliations approval status for 2 avaliations" do
      expect(saved_student.approval_status).to eql({status: 'pending',
                                              msg: t("student.pending_avaliations")})
    end

    it "returns not approved approval status for 4 avaliations and average grade < 6" do
      2.times { teacher.evaluations.create(student_id: saved_student.id, grade: 5) }

      expect(saved_student.approval_status).to eql({status: 'not-approved',
                                                    msg: t("student.not_approved")})
    end

    it "returns approved approval status for 4 avaliations and average grade >= 6" do
      2.times { teacher.evaluations.create(student_id: saved_student.id, grade: 7) }

      expect(saved_student.approval_status).to eql({status: 'approved',
                                                    msg: t("student.approved")})
    end

  end
end
