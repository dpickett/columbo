module Columbo
  class Screening < Base
    element :reference_id, String, :tag => "ReferenceId/IdValue"
  end
end