# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def mypage
    @whiskies = current_user.whiskies
  end

  def favorites
    @whiskies = current_user.favorite_whiskies
  end
end
