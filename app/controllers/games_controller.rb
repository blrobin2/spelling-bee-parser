# frozen_string_literal: true

class GamesController < ApplicationController
  def index
    @url = game_params[:url]
    if @url.present? && @url =~ URI::DEFAULT_PARSER.make_regexp
      @uri = URI.parse(@url)
      @hash = Rack::Utils.parse_nested_query(@uri&.query)

      unless @hash.empty?
        @game_date = Date.parse(@hash['d'])&.to_fs(:long)
        @game_rank = @hash['r']
        @points = @hash['p']
      end
    end
  rescue URI::InvalidURIError
    # Ignore malformed URI
  end

  private

    def game_params
      params.permit(:url, :commit)
    end
end
