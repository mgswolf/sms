require 'spec_helper'

describe "Editing Student" do
  let(:school_class) { FactoryGirl.create(:school_class)}
  let(:student) { FactoryGirl.create(:student, school_class: school_class)}
  before do
    ensure_on edit_student_path(student)
  end

  describe "with valid args" do
    before do
      fill_in t("form.student.name"), with: "Title 02"
      click_button t("helpers.submit.student.update")
    end

    it "show success message" do
      page.should have_content(t("flash.students.update.notice"))
    end
  end

  describe "with invalid args" do
    before do
      fill_in t("form.student.name"), with: ""
      click_button t("helpers.submit.student.update")
    end

    it "show error message" do
      page.should have_content(t("flash.students.update.alert"))
    end
  end
end