class UsersController < ApplicationController
  before_action :authenticate_user!

  def mypage
    @whiskies = current_user.whiskies
  end
end
