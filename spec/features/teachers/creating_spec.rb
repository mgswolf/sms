require  'spec_helper'

describe "Creating a new Teacher" do
  before do
    ensure_on new_teacher_path
  end

  describe "with valid args" do
    before do
      fill_in t("form.teacher.name"), with: 'Joe'
      click_button t("helpers.submit.teacher.create")
    end
    let(:teacher) { Teacher.last }
    it "redirect to teacher info page" do
      current_path.should == teacher_path(teacher)
    end

    it "show success message" do
      page.should have_content(t("flash.teachers.create.notice"))
    end
  end

  describe "with invalid args" do
    before do
      click_button t("helpers.submit.teacher.create")
    end
    it "show error message" do
      page.should have_content(t("flash.teachers.create.alert"))
    end
  end
end