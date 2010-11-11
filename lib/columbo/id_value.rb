module Columbo
  class IdValue < Base
    attribute :name, String, :tag => "IdValue"
    content :value
  end
end