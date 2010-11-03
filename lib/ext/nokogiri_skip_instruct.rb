#courtesy https://gist.github.com/322172
require 'nokogiri'
module Nokogiri
 module XML
   class Builder
     def to_xml(*args)
       dok = @doc.to_xml(*args)
       if args.last.is_a?(Hash)
         args.last.each do |k,v| 
           case k
           when :skip_instruct: dok.sub!(/^(\s+)?<\?xml version="1\.0"\?>\n?/, "")
           # not your fathers indent => this indents the whole damn page
           when :indent:        dok.gsub!(/^/, "#{"\s" * v}")
           end 
         end
       end 
       return dok
     end
   end 
 end
end