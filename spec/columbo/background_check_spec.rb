require 'spec_helper'

describe Columbo::BackgroundCheck do
  let(:family_name) do
    family_name = Columbo::FamilyName.new
    family_name.primary = true
    family_name.value = "Smith"
    family_name
  end

  let(:person_name) do
    person_name = Columbo::Name.new
    person_name.given_name = "John" 
    person_name.middle_name = "F"
    person_name.family_names ||= []
    person_name.family_names << family_name
    person_name
  end

  let(:personal_data) do
    personal_data = Columbo::PersonalData.new
    personal_data.person_names ||= []
    personal_data.person_names << person_name
    personal_data
  end

  subject do
    check = Columbo::BackgroundCheck.new
    check.reference_id = "1234"
    check.personal_data = personal_data
    check
  end
  
  it 'should render xml without error' do
    puts subject.to_xml
  end
end
