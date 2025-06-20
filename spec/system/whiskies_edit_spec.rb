# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Whiskies Edit', type: :system do
  let(:user) { create(:user) }
  let!(:whisky) { create(:whisky, name: '竹鶴', user: user) }

  before do
    sign_in user
    visit edit_whisky_path(whisky)
  end

  it '名前を編集して更新できる' do
    fill_in '銘柄名', with: '竹鶴 21年'
    click_button '登録'

    expect(current_path).to eq whisky_path(whisky)
    expect(page).to have_content '竹鶴 21年'
  end
end
