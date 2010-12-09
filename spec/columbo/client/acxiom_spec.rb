require 'spec_helper'
require 'columbo/client'

describe Columbo::Client::Acxiom do
  before(:all) do
    configatron.columbo.acxiom.username = ""
    configatron.columbo.acxiom.password = ""
    configatron.columbo.acxiom.url      = "https://aissreports.acxiom.com/XMLBackgroundTests/Request.asmx?wsdl"
  end

  subject { Columbo::Client::Acxiom.new }


  its(:connection) { should_not be_nil }

  describe "submitting" do

    it "successfully sends xml" do
      xml = File.read(File.join(File.dirname(__FILE__), "../../fixtures/acxiom/proper_request.xml"))
      check = stub
      check.stubs(:to_xml).returns(xml)
      subject.submit(check)
    end
  end
end
