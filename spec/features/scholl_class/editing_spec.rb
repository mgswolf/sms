require 'spec_helper'

describe "Editing School Class" do
  let(:school_class) { FactoryGirl.create(:school_class)}
  before do
    ensure_on edit_school_class_path(school_class)
  end

  describe "with valid args" do
    before do
      fill_in t("form.school_class.name"), with: "Title 02"
      click_button t("helpers.submit.school_class.update")
    end

    it "show success message" do
      page.should have_content(t("flash.school_classes.update.notice"))
    end
  end

  describe "with invalid args" do
    before do
      fill_in t("form.school_class.name"), with: ""
      click_button t("helpers.submit.school_class.update")
    end

    it "show error message" do
      page.should have_content(t("flash.school_classes.update.alert"))
    end
  end
end