require 'spec_helper'

describe "Deleting Teacher" do
  let(:teacher) { FactoryGirl.create(:teacher)}
  before do
    ensure_on teacher_path(teacher)
    click_link t("helpers.actions.destroy")
  end

  it "destroy and redirect to teachers list" do
    current_path.should == teachers_path
  end

  it "show success message" do
    page.should have_content(t("flash.teachers.destroy.notice"))
  end
end