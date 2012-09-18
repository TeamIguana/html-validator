require 'nokogiri'

module Test
  module Unit
    module Assertions
      def assert_is_xhtml_trans_valid(page)
        schema_path = File.join(File.dirname(__FILE__), '..', 'schemas', 'xhtml1-transitional.xsd')
        schema = Nokogiri::XML::Schema(open(schema_path))

        errors = schema.validate(Nokogiri::XML(page))

        if errors.any?
          message = "#{errors.count} errors:\n"
          errors.each{|error| message << "#{error}\n"}
          raise AssertionFailedError.new(message)
        end
      end
    end
  end
end
