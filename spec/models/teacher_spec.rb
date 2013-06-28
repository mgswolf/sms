require 'spec_helper'

describe Teacher do
  let(:teacher) { FactoryGirl.build(:teacher) }
  subject { teacher }

  it { should be_valid }
  it "respond to school classes"
  it "respond to students"
  it "respond to evaluations"

  describe "have a name" do
    before { teacher.name = nil }
    it { should_not be_valid }
  end


end
