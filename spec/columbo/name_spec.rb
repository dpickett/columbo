require 'spec_helper'

describe Columbo::Name do
  describe "to_xml" do
    let(:family_name) do
      Columbo::FamilyName.new(:primary => true, :value => "Smith")
    end
    
    let(:name) do
      Columbo::Name.new(:given_name => "John", :middle_name => "Sam", :family_names => [family_name])
    end
      
    subject { name.to_xml }
    
    it { should =~ /#{Regexp.escape(family_name.to_xml(:skip_instruct => true))}/}
  end
end