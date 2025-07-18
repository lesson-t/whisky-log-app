# frozen_string_literal: true

require 'test_helper'

class WhiskiesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get whiskies_index_url
    assert_response :success
  end

  test 'should get show' do
    get whiskies_show_url
    assert_response :success
  end

  test 'should get new' do
    get whiskies_new_url
    assert_response :success
  end

  test 'should get edit' do
    get whiskies_edit_url
    assert_response :success
  end
end
