require 'spec_helper'

describe "Editing Teacher" do
  let(:teacher) { FactoryGirl.create(:teacher)}
  before do
    ensure_on edit_teacher_path(teacher)
  end

  describe "with valid args" do
    before do
      fill_in t("form.teacher.name"), with: "Name 02"
      click_button t("helpers.submit.teacher.update")
    end

    it "show success message" do
      page.should have_content(t("flash.teachers.update.notice"))
    end
  end

  describe "with invalid args" do
    before do
      fill_in t("form.teacher.name"), with: ""
      click_button t("helpers.submit.teacher.update")
    end

    it "show error message" do
      page.should have_content(t("flash.teachers.update.alert"))
    end
  end
end