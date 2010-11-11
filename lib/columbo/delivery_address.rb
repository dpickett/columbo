module Columbo
  class DeliveryAddress < Base
    tag "DeliveryAddress"
    
    element :street_name, String, :tag => "StreetName"
    element :building_number, String, :tag => "BuildingNumber"
  end
end
