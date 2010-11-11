module Columbo
  class Screenings < Base
    tag "Screenings"
    
    element :package_id, String, :tag => "PackageId/IdValue"
    has_one :client_references, Columbo::ClientReferences, :tag => "ClientReferences"
    has_many :screenings, Columbo::Screening, :tag => "Screening"
  end
end