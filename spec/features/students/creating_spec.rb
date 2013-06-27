require  'spec_helper'

describe "Creating a new School Class" do
  let!(:school_class) { FactoryGirl.create(:school_class) }
  before do
    ensure_on new_student_path
  end

  describe "with valid args" do
    before do
      fill_in t("form.student.name"), with: 'Design'
      select(school_class.name, :from => t("form.student.school_class"))

      click_button t("helpers.submit.student.create")
    end
    let(:student) { Student.last }
    it "redirect to student info page" do
      current_path.should == student_path(student)
    end

    it "show success message" do
      page.should have_content(t("flash.students.create.notice"))
    end
  end

  describe "with invalid args" do
    before do
      click_button t("helpers.submit.student.create")
    end
    it "show error message" do
      page.should have_content(t("flash.students.create.alert"))
    end
  end
end