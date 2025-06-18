class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_whisky, only: %i[create destroy]

  def index
    @favorite_whiskies = current_user.favorite_whiskies.order(drank_on: :desc)
  end

  def create
    current_user.favorites.create(whisky: @whisky)
    redirect_back fallback_location: whiskies_path
  end

  def destroy
    favorite = current_user.favorites.find_by(whisky: @whisky)
    favorite&.destroy
    redirect_back fallback_location: whiskies_path
  end

  private

  def set_whisky
    @whisky = Whisky.find(params[:whisky_id])
  end
end
