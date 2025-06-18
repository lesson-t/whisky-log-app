class WhiskiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_whisky #, only: %i[show edit update destroy remove_image]
  before_action :correct_user, only: %i[edit update destroy remove_image]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @q = current_user.whiskies.ransack(params[:q])
    @pagy, @whiskies = pagy(@q.result(distinct: true).order(drank_on: :desc), times: 10)

    # @whiskies = current_user.whiskies.order(drank_on: :desc)
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
  end

  def update
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

  # 画像削除用のアクションを追加
  def remove_image
    @whisky = current_user.whiskies.find(params[:id])
    image = @whisky.images.find(params[:image_id])
    image.purge
    redirect_to @whisky, notice: "画像を削除しました"
  end

  private

  def set_whisky
    @whisky = Whisky.find(params[:id])
  end

  def correct_user
    redirect_to root_path, alert: "権限がありません" unless @whisky.user == current_user
  end

  def authorize_user!
    unless @whisky.user == current_user
      redirect_to root_path, alert: "Not authorized"
    end
  end

  def whisky_params
    params.require(:whisky).permit(:name, :genre, :country, :status, :rating, :comment, :drank_on, images: [])
  end
end
