# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Whiskies Create', type: :system do
  let(:user) { create(:user) }

  before do
    sign_in user
    visit new_whisky_path
  end

  it '正しく入力すれば作成される' do
    fill_in '銘柄名', with: '白州'
    fill_in 'ジャンル', with: 'スコッチ'
    fill_in '原産国', with: '日本'
    select '未飲', from: '状態'
    fill_in '評価', with: 4
    fill_in '感想', with: '爽やかで飲みやすい'
    fill_in '飲んだ日', with: '2024-06-01'
    click_button '登録'

    expect(page).to have_content '白州'
    expect(current_path).to eq whisky_path(Whisky.last)
  end

  it '名前を未入力だとエラーメッセージが出る' do
    click_button '登録'
    expect(page).to have_content "Name can't be blank" # 日本語化する"名前を入力してください"
  end
end
