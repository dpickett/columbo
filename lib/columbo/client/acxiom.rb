require "savon"
require "configatron"

module Columbo
  module Client
    class Acxiom
      def connection
        unless @connection
          require "ruby-debug"
          @connection ||= Savon::Client.new self.class.url
        end

        @connection
      end

      def submit(background_check)
        connection.submit_request do |soap|
          soap.version = 1
          soap.namespaces["xmlns:ns1"] = "https://aissreports.acxiom.com/XMLBackgroundTests/"
          soap.header = {"ns1:AuthenticationHeader" => {"ns1:UserId" => self.class.username, "ns1:Password" => self.class.password}}
          soap.body = {"ns1:XMLDocumentString" => background_check.to_xml.to_s }
        end
      end

      class << self
        def url
          configuration[:url]
        end

        def username
          configuration[:username]
        end

        def password
          configuration[:password]
        end

        private
        def configuration
          configatron.columbo.acxiom.to_hash
        end
      end
      
    end
  end
end
