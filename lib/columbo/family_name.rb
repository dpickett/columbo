module Columbo
  class FamilyName < Base
    tag "FamilyName"
    
    attribute :primary, Boolean
    content :value
  end
end
