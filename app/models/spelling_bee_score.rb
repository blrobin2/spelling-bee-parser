# frozen_string_literal: true

class SpellingBeeScore
    include ActiveModel::API
    include UrlParsable

    attr_accessor :date, :rank, :points

    def self.from_share_url(url)
        query_hash = query_hash_from(url)

        return nil unless query_hash.present?

        score = self.new
        score.date = Date.parse(query_hash['d'])
        score.rank = query_hash['r']
        score.points = query_hash['p']
        score
    end
end
