module Columbo
  class ContactMethod < Base
    element :telephone_number, String, :tag => "Telephone/FormattedNumber"
  end
end