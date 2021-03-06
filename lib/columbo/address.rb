module Columbo
  class Address < Base
    attribute :address_type, String, :tag => "type"
    element :country_code, String, :tag => "CountryCode"
    element :postal_code, String, :tag => "PostalCode"
    element :region, String, :tag => "Region"
    element :municipality, String, :tag => "Municipality"
    has_one :delivery_address, Columbo::DeliveryAddress, :tag => "DeliveryAddress"
  end
end