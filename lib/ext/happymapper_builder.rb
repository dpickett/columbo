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
  
    def to_xml(options = {})
      builder = Nokogiri::XML::Builder.new do |xml|
        xml.send(options[:root] || self.class.tag_name, attributes) do |xml_obj|
          self.class.elements.each do |happymapper_element|
            if self.send(happymapper_element.name) != nil
              append_xml_element(xml_obj, happymapper_element)
            end
          end

          if self.class.respond_to?(:content) && !self.class.content_accessor.nil?
            xml_obj.text self.send(self.class.content_accessor)
          end
        end
      end
      
      builder.to_xml(options)
    end
  
    private
    def append_xml_element(builder, happymapper_element)
      recursive_element(builder, happymapper_element.tag) do |new_builder, tag|
        if self.send(happymapper_element.method_name) != nil
          if happymapper_element.primitive?
            new_builder.send(tag, self.send(happymapper_element.name))
          else
            #it's a nested happymapper object or array of objects
            values = self.send(happymapper_element.name)
            values = [values] unless values.is_a?(Array)
            values.each {|i| new_builder << i.to_xml(:skip_instruct => true, :root => tag, :builder => new_builder) }
          end
        end
      end
    end
    
    def recursive_element(builder, tag_name, &block)
      other_tags = tag_name.is_a?(Array) ? tag_name : tag_name.split("\/") 
      tag = other_tags.shift
      if tag
        builder.send(tag) do |new_builder|
          if other_tags.empty?
            yield(new_builder, tag)
          else
            recursive_element(new_builder, other_tags, &block)
          end
        end
      else
        yield(builder, tag_name)
      end
    end
  end
end