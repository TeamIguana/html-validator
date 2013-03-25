require 'nokogiri'
require 'test-unit'

module Test
  module Unit
    module Assertions
      def assert_is_xhtml_trans_valid(page)
        schema_path = schema_path_for('xhtml1-transitional.xsd')
        schema = Nokogiri::XML::Schema(open(schema_path))

        validate(page, schema)
      end

      def assert_is_html5_valid(page)
        schema_path = schema_path_for('html5', 'html5.rng')
        schema = Nokogiri::XML::RelaxNG(File.open(schema_path))

        validate(page, schema)
      end

      def schema_path_for(*relative_name)
        File.join(File.dirname(__FILE__), '..', 'schemas', *relative_name)
      end

      def validate(page, schema)
        errors = schema.validate(Nokogiri::XML(page))

        if errors.any?
          message = "#{errors.count} errors:\n"
          errors.each { |error| message << "#{error}\n" }
          raise AssertionFailedError.new(message)
        end
      end
    end
  end
end
