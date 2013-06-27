require 'spec_helper'

describe "Deleting School Class" do
  let(:school_class) { FactoryGirl.create(:school_class)}
  before do
    ensure_on school_class_path(school_class)
    click_link t("helpers.actions.destroy")
  end

  it "destroy and redirect to services list" do
    current_path.should == school_classes_path
  end

  it "show success message" do
    page.should have_content(t("flash.school_classes.destroy.notice"))
  end
end