module Columbo
  class ClientReferences < Base
    tag "ClientReferences"
    
    has_many :id_values, Columbo::IdValue, :tag => "IdValue"
  end
end