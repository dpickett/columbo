module Columbo
  class Name < Base
    element :given_name, String, :tag => "GivenName"
    element :middle_name, String, :tag => "MiddleName"
    has_many :family_names, Columbo::FamilyName, :tag => "FamilyName"
  end
end