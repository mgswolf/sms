require  'spec_helper'

describe "Creating a new Evaluation" do
  let(:teacher) { FactoryGirl.create(:teacher) }
  let(:school_class) { FactoryGirl.create(:school_class) }
  let!(:student) { FactoryGirl.create(:student, school_class: school_class) }
  before do
    teacher.school_classes << school_class
    ensure_on new_teacher_evaluation_path(teacher)
  end

  describe "with valid args" do
    before do
      select(student.name_n_school_class, from: t("form.evaluation.student"))
      fill_in t("form.evaluation.grade"), with: '8.5'
      fill_in t("form.evaluation.title"), with: 'Second quarter evaluation'
      click_button t("helpers.submit.evaluation.create")
    end
    let(:evaluation) { Evaluation.last }
    it "redirect to evaluation info page" do
      current_path.should == teacher_evaluation_path(teacher, evaluation)
    end

    it "show success message" do
      page.should have_content(t("flash.evaluations.create.notice"))
    end
  end

  describe "with invalid args" do
    before do
      click_button t("helpers.submit.evaluation.create")
    end
    it "show error message" do
      page.should have_content(t("flash.evaluations.create.alert"))
    end
  end
end