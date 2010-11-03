require 'spec_helper'

describe Columbo::FamilyName do
  describe "to_xml" do
    let(:family_name) do
      Columbo::FamilyName.new(:primary => true, :value => "Smith")
    end
      
    subject { family_name.to_xml }
    
    it { should =~ /primary=\"true\"/}
    it { should =~ /Smith/ }
  end
end