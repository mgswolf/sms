require 'spec_helper'

describe SchoolClass do
  let(:school_class) { FactoryGirl.build(:school_class) }
  subject { school_class }

  it { should be_valid }
  it "have students"
  it "have teachers"

  describe "have a name" do
    before { school_class.name = nil }
    it { should_not be_valid }
  end
end
