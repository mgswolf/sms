require 'spec_helper'

describe "Viewing Students" do
  let(:school_class) { FactoryGirl.create(:school_class) }
  before do
    3.times { FactoryGirl.create(:student, school_class: school_class)}
    ensure_on students_path
  end
  let(:student) { Student.first}

  describe "when click link to student info" do
    before { find("#student_#{student.id}" ).click_link t("helpers.actions.show") }

    it "show school class info page" do
      current_path == student_path(student)
    end
  end

  describe "search" do
    before do
      FactoryGirl.create(:student, name: 'Joe', school_class: school_class)
      FactoryGirl.create(:student, name: 'Paul', school_class: school_class)
      fill_in "search_name_contains", with: 'Joe'
      click_button t('helpers.links.search')
    end

    it "show Joe" do
      page.should have_content('Joe')
    end

    it "don't show Paul" do
      page.should_not have_content('Paul')
    end
  end
end