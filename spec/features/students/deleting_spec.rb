require 'spec_helper'

describe "Deleting Student" do
  let(:school_class) { FactoryGirl.create(:school_class)}
  let(:student) { FactoryGirl.create(:student, school_class: school_class)}
  before do
    ensure_on student_path(student)
    click_link t("helpers.actions.destroy")
  end

  it "destroy and redirect to students list" do
    current_path.should == students_path
  end

  it "show success message" do
    page.should have_content(t("flash.students.destroy.notice"))
  end
end