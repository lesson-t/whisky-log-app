# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Whisky tag display', type: :system do
  let!(:user) { create(:user) }
  let!(:whisky) { create(:whisky, user: user, name: '山崎', tag_list: 'ジャパニーズ, シングルモルト') }

  before do
    sign_in user
  end

  it 'displays tags on index' do
    visit whiskies_path
    expect(page).to have_content('ジャパニーズ')
    expect(page).to have_content('シングルモルト')
  end

  it 'displays tags on show page' do
    visit whisky_path(whisky)
    expect(page).to have_content('ジャパニーズ')
    expect(page).to have_content('シングルモルト')
  end
end
