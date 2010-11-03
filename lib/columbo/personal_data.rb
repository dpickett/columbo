module Columbo
  class PersonalData < Base
    include HappyMapper
    
    has_many :person_names, Columbo::Name, :tag => "PersonName"
    has_many :postal_addresses, Columbo::Address, :tag => "PostalAddress"
    has_many :contact_methods, Columbo::ContactMethod, :tag => "ContactMethod"
    # has_one :demographic_detail, Columbo::DemographicDetail, :tag => "DemographicDetail"
  end
end