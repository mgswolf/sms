require 'spec_helper'

describe "Viewing School Classes" do
  before do
    3.times { FactoryGirl.create(:school_class) }
    ensure_on school_classes_path
  end
  let(:school_class) { SchoolClass.first}

  describe "when click link to scholl class info" do
    before { find("#school_class_#{school_class.id}" ).click_link t("helpers.actions.show") }

    it "show school class info page" do
      current_path == school_class_path(school_class)
    end
  end

  describe "search" do
    before do
      FactoryGirl.create(:school_class, name: 'Computer Science')
      FactoryGirl.create(:school_class, name: 'Information System')
      fill_in "search_name_contains", with: 'Information System'
      click_button t('helpers.links.search')
    end

    it "show Information System" do
      page.should have_content('Information System')
    end

    it "don't show Computer Science" do
      page.should_not have_content('Computer Science')
    end
  end


end