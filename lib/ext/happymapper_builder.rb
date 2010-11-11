#include this after HappyMapper
module HappyMapper
  module Builder
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods
      def content_accessor
        @content
      end
    end
    
    def attributes
      self.class.attributes.inject({}) do |memo, attr|
        memo[attr.name.to_sym] = self.send(attr.name)
        memo
      end
    end
    
    def element_map
      self.class.elements.inject({}) do |map, element|
        recursive_element_map(map, element)
        map
      end
    end
    
    def recursive_element_map(map, element, tags = nil)
      tags = tags || element.tag.split("/")
      if tags.size == 1
        map[tags.first] = element
      else
        map[tags.first] ||= {}
        recursive_element_map(map[tags.first], element, tags[1..-1])
      end
    end
    
    def to_xml(options = {})
      builder = Nokogiri::XML::Builder.new do |xml|
        xml.send(options[:root] || self.class.tag_name, attributes) do |xml_obj|
          if self.class.respond_to?(:content) && !self.class.content_accessor.nil?
            xml_obj.text self.send(self.class.content_accessor)
          end
          recurse_through_element_map(xml_obj, element_map)
        end
      end
      builder.to_xml(options)
    end
    
    def recurse_through_element_map(xml_obj, element_map)
      element_map.each do |key, value|
        if value.is_a?(HappyMapper::Element)
          happymapper_element = value
          if self.send(happymapper_element.name) != nil
            if happymapper_element.primitive?
              xml_obj.send(key, self.send(happymapper_element.name))
            else
              values = self.send(happymapper_element.name)
              values = [values] unless values.kind_of?(Array)
              values.each {|i| xml_obj << i.to_xml(:skip_instruct => true, :root => key, :builder => xml_obj) }
            end
          end
        else
          xml_obj.send(key) do |new_builder|
            recurse_through_element_map(new_builder, value)
          end
        end
      end
    end
  end
end