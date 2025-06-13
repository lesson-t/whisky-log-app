class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  require 'pagy/extras/bootstrap' # ← Bootstrap使ってるなら
  include Pagy::Backend
end
