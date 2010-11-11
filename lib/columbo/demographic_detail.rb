module Columbo
  class DemographicDetail < Base
    tag "DemographicDetail"
    
    has_one :government_id, Columbo::GovernmentId, :tag => "GovernmentId"
    element :date_of_birth, Date, :tag => "DateOfBirth"
  end
end