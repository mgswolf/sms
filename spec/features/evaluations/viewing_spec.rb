require 'spec_helper'

describe "Viewing Teachers" do
  let(:school_class) { FactoryGirl.create(:school_class) }
  let(:student) { FactoryGirl.create(:student, school_class: school_class) }
  let!(:teacher) { FactoryGirl.create(:teacher)}
  let!(:professor_xavier) { FactoryGirl.create(:teacher, name: 'Charles Xavier') }
  before do
    3.times { FactoryGirl.create(:evaluation, student: student, teacher: teacher)}
    ensure_on evaluations_path
  end
  let(:evaluation) { Evaluation.first}

  describe "when click link to evaluation info" do
    before { find("#evaluation_#{evaluation.id}" ).click_link t("helpers.actions.show") }

    it "show evaluation info page" do
      current_path == teacher_evaluation_path(teacher,evaluation)
    end
  end

  describe "search" do
    before do
      FactoryGirl.create(:evaluation, teacher: professor_xavier, student: student)
      select(professor_xavier.name, :from => 'search_teacher_id_equals')
      click_button t('helpers.links.search')
    end

    it "show professor xavier name" do
      page.should have_selector(".evaluation", text: professor_xavier.name)
    end

    it "don't show teacher name" do
      page.should_not have_content(".evaluation", text: teacher.name)
    end
  end
end