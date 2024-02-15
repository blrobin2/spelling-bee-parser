# frozen_string_literal: true

class GamesController < ApplicationController
  def index
    @url = game_params[:url]
    return unless @url.present?

    @score = SpellingBeeScore.from_share_url(@url)
  end

  private

    def game_params
      params.permit(:url, :commit)
    end
end
