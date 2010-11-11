module Columbo
  class BackgroundCheck < Base
    include HappyMapper
    
    tag "BackgroundCheck"
    element :reference_id, String, :tag => "BackgroundSearchPackage/ReferenceId/IdValue"
    has_one :personal_data, Columbo::PersonalData, :tag => "BackgroundSearchPackage/PersonalData"
    has_many :screenings, Columbo::Screening, :tag => "BackgroundSearchPackage/Screenings"
  end
end