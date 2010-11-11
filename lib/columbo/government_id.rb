module Columbo
  class GovernmentId < Base
    tag "GovernmentId"
    
    attribute :country_code, String, :tag => "countryCode"
    attribute :issuing_authority, String, :tag => "issuingAuthority"
    content :value
    
  end
end