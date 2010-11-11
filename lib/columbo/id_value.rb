module Columbo
  class IdValue < Base
    tag "IdValue"
    
    attribute :name, String, :tag => "name"
    content :value
  end
end