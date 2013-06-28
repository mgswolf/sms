require 'spec_helper'

describe "Deleting Evaluation" do
  let(:teacher) { FactoryGirl.create(:teacher)}
  let(:school_class) { FactoryGirl.create(:school_class)}
  let(:student) { FactoryGirl.create(:student, school_class: school_class)}
  let(:evaluation) { FactoryGirl.create(:evaluation, teacher: teacher, student: student)}
  before do
    teacher.school_classes << school_class
    ensure_on teacher_evaluation_path(teacher,evaluation)
    click_link t("helpers.actions.destroy")
  end

  it "destroy and redirect to evaluations list" do
    current_path.should == evaluations_path
  end

  it "show success message" do
    page.should have_content(t("flash.evaluations.destroy.notice"))
  end
end