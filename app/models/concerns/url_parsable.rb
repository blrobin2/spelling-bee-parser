# frozen_string_literal: true

module UrlParsable
    extend ActiveSupport::Concern

    class_methods do
        def query_hash_from(url)
            return nil unless url =~ URI::DEFAULT_PARSER.make_regexp

            uri = URI.parse(url)
            hash = Rack::Utils.parse_nested_query(uri&.query)

            return nil if hash.empty?

            hash
        end
    end
end
