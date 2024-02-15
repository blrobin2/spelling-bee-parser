# frozen_string_literal: true

require 'test_helper'

class SpellingBeeScoreTest < ActiveSupport::TestCase
    test 'it understands a valid share score' do
        url = 'https://www.nytimes.com/badges/games/v1/bee.html?d=2024-01-22&l=fadekln&p=108&r=Genius&c=af88ac543ec31d453599baaddb26f819&smid=url-share'
        score = SpellingBeeScore.from_share_url(url)

        assert_equal '2024-01-22', score.date.to_fs(:date)
        assert_equal 'Genius', score.rank
        assert_equal '108', score.points
    end
end
