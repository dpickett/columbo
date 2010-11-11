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

  let(:delivery_address) do
    delivery_address = Columbo::DeliveryAddress.new
    delivery_address.street_name = "10 Rodeo Drive"
    delivery_address.building_number = "70"
    delivery_address
  end

  let(:postal_address) do
    address = Columbo::Address.new
    address.country_code = "US"
    address.postal_code = "90210"
    address.region = "CA"
    address.municipality = "Beverly Hills"
    address.delivery_address = delivery_address
    address.address_type = "streetAddress"
    address
  end

  let(:contact_method) do
    method = Columbo::ContactMethod.new
    method.telephone_number = "508-697-5309"
    method
  end

  let(:demographic_detail) do
    detail = Columbo::DemographicDetail.new
    detail.government_id = Columbo::GovernmentId.new
    detail.date_of_birth = "1984-03-09"
    detail
  end

  let(:personal_data) do
    personal_data = Columbo::PersonalData.new
    personal_data.person_names ||= []
    personal_data.person_names << person_name

    personal_data.postal_addresses ||= []
    personal_data.postal_addresses << postal_address

    personal_data.contact_methods ||= []
    personal_data.contact_methods << contact_method

    personal_data.demographic_detail = demographic_detail

    personal_data
  end

  let(:subcode_id) do
    subcode = Columbo::IdValue.new
    subcode.name = "Subcode"
    subcode.value = "E8085235"
    subcode
  end

  let(:client_references) do
    ref = Columbo::ClientReferences.new
    ref.id_values ||= []
    ref.id_values << subcode_id
    ref
  end

  let(:screening) do
    s = Columbo::Screening.new
    s.reference_id = 5011
    s
  end

  let(:screenings) do
    screenings = Columbo::Screenings.new
    screenings.client_references = client_references
    screenings.screenings = []
    screenings.screenings << screening
    screenings.package_id = 9386
    screenings
  end

  subject do
    check = Columbo::BackgroundCheck.new
    check.reference_id = "1234"
    check.personal_data = personal_data
    check.screenings = screenings
    check
  end
  
  it 'should render xml without error' do
    lambda { subject.to_xml }.should_not raise_error 
  end
end
