# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Favorites Page', type: :system do
  let(:user) { create(:user) }
  let!(:whisky1) { create(:whisky, name: '山崎') }
  let!(:whisky2) { create(:whisky, name: '白州') }

  before do
    sign_in user
  end

  context 'when favorites exist' do
    before do
      user.favorites.create(whisky: whisky1)
      visit favorites_path
    end

    it 'shows list of favorited whiskies' do
      expect(page).to have_content '山崎'
    end

    it 'has working detail and unfavorite buttons' do
      expect(page).to have_link('詳細', href: whisky_path(whisky1))
      expect(page).to have_button('お気に入り解除')
      click_button 'お気に入り解除'
      expect(page).not_to have_content '山崎'
    end
  end

  context 'when no favorites exist' do
    it 'shows message when no favorites exist' do
      visit favorites_path
      expect(page).to have_content 'お気に入りに登録されたウイスキーはありません。'
    end
  end
end
