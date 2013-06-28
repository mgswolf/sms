require 'spec_helper'

describe "Viewing Teachers" do
  before do
    3.times { FactoryGirl.create(:teacher)}
    ensure_on teachers_path
  end
  let(:teacher) { Teacher.first}

  describe "when click link to teacher info" do
    before { find("#teacher_#{teacher.id}" ).click_link t("helpers.actions.show") }

    it "show teacher info page" do
      current_path == teacher_path(teacher)
    end
  end

  describe "search" do
    before do
      FactoryGirl.create(:teacher, name: 'Joe')
      FactoryGirl.create(:teacher, name: 'Paul')
      fill_in "search_name_contains", with: 'Joe'
      click_button t('helpers.links.search')
    end

    it "show Joe" do
      page.should have_content('Joe')
    end

    it "don't show Paul" do
      page.should_not have_content('Paul')
    end
  end
end