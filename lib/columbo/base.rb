module Columbo
  class Base
    def self.inherited(child)
      child.send(:include, HappyMapper)
      child.send(:include, HappyMapper::Builder)
    end
    
    def initialize(attrs = {})
      attrs.each do |key, value|
         self.send("#{key}=", value) if self.respond_to?("#{key}=")
      end
    end
  end
end