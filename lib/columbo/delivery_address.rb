module Columbo
  class DeliveryAddress < Base
    tag "DeliveryAddress"
    
    element :street_number, :tag => "StreetName"
    element :building_number, :tag => "BuildingNumber"
  end
end