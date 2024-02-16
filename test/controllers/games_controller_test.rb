# frozen_string_literal: true

require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  test 'should get root' do
    get root_url

    assert_response :success
  end

  test 'should get root with query' do
    get root_url(url: 'test')

    assert_response :success
  end
end
