require  'spec_helper'

describe "Creating a new School Class" do
  before do
    ensure_on new_school_class_path
  end

  describe "with valid args" do
    before do
      fill_in t("form.school_class.name"), with: 'Design'
      click_button t("helpers.submit.school_class.create")
    end
    let(:school_class) { SchoolClass.last }
    it "redirect to school class info page" do
      current_path.should == school_class_path(school_class)
    end

    it "show success message" do
      page.should have_content(t("flash.school_classes.create.notice"))
    end
  end

  describe "with invalid args" do
    before do
      click_button t("helpers.submit.school_class.create")
    end
    it "show error message" do
      page.should have_content(t("flash.school_classes.create.alert"))
    end
  end

end