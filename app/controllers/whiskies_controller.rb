class WhiskiesController < ApplicationController
  before_action :set_whisky, only: %i[show edit update destroy]

  def index
    @whiskeis = current_user.whiskeis.order(drank_on: :desc)
  end

  def show
  end

  def new
    @whisky = current_user.whiskies.build
  end

  def create
    @whisky = current_user.whiskies.build(whisky_params)
    if @whisky.save
      redirect_to @whisky, notice: "ウイスキーを登録しました。"
    else
      render :new
    end
  end

  def edit
    if @whisky.update(whisky_params)
      redirect_to @whisky, notice: "ウイスキー情報を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @whisky.destroy
    redirect_to whiskies_path, notice: "削除しました。"
  end

  private

  def set_whisky
    @whisky = current_user.whiskeis.find(params[:id])
  end

  def whisky_params
    params.require(:whisky).permit(:name, :genre, :country, :status, :rating, :comment, :drank_on)
  end
end
