require 'spec_helper'

describe "Editing Evaluation" do
  let(:teacher) { FactoryGirl.create(:teacher)}
  let(:school_class) { FactoryGirl.create(:school_class) }
  let!(:student) { FactoryGirl.create(:student, school_class: school_class) }
  let(:evaluation) { FactoryGirl.create(:evaluation, teacher: teacher, student: student) }
  before do
    teacher.school_classes << school_class
    ensure_on edit_teacher_evaluation_path(teacher, evaluation)
  end

  describe "with valid args" do
    before do
      fill_in t("form.evaluation.grade"), with: "8.7"
      click_button t("helpers.submit.evaluation.update")
    end

    it "show success message" do
      page.should have_content(t("flash.evaluations.update.notice"))
    end
  end

  describe "with invalid args" do
    before do
      fill_in t("form.evaluation.grade"), with: ""
      click_button t("helpers.submit.evaluation.update")
    end

    it "show error message" do
      page.should have_content(t("flash.evaluations.update.alert"))
    end
  end
end