require 'spec_helper'

describe Columbo::ContactMethod do
  describe "to xml" do
    let(:contact_method) { Columbo::ContactMethod.new(:telephone_number => "508-697-5309")}
    subject { contact_method.to_xml }
    it { should =~ /#{contact_method.telephone_number}/ }
    it { should =~ /<Telephone>/}
    it { should =~ /<FormattedNumber>/ }
  end
end