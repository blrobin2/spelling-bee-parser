# frozen_string_literal: true

class SpellingBeeScore
    include ActiveModel::API
    include UrlParsable

    attr_accessor :date, :rank, :points

    def self.from_share_url(url)
        parsed_url = parse_url(url)

        return nil unless parsed_url.present?

        score = self.new
        score.date = Date.parse(parsed_url['d'])
        score.rank = parsed_url['r']
        score.points = parsed_url['p']
        score
    end
end
