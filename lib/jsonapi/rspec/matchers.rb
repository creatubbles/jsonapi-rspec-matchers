require "jsonapi/rspec/matchers/version"
require "Jsonapi/rspec/matchers/railtie"

module Jsonapi
  module RSpec
    module Matchers
      def json
        body = (response.body.presence || {}).to_s
        @json ||= JSON.parse(body)
      end

      ::RSpec::Matchers.define :be_valid_json_api_object_response do |object|
        match do |given|
          object_data = ActionController::Parameters.new(JSON.parse(given.body))
          object_attrs = ActiveModelSerializers::Adapter::JsonApi::Deserialization.
            parse(object_data)
          object_attrs.tap { |h| h[:id] = h[:id].to_i }
          expect(object).to have_attributes object_attrs.with_indifferent_access
        end

        failure_message do |given|
          object_data = ActionController::Parameters.new(JSON.parse(given.body))
          object_attrs = ActiveModelSerializers::Adapter::JsonApi::Deserialization.
            parse(object_data).stringify_keys.tap { |h| h['id'] = h['id'].to_i }

          "Expect #{object.model_name} attributes \n #{object.attributes} \n to include \n #{object_attrs} \n but there is no match."
        end
      end
    end
  end
end

RSpec.configuration.include Jsonapi::RSpec::Matchers
