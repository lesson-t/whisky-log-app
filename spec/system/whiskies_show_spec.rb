require 'rails_helper'

RSpec.describe "WhiskiesShow", type: :system do
  let(:user) { FactoryBot.create(:user) }
  let!(:whisky) { create(:whisky, name: "山崎", comment: "フルーティー", user: user) }

  before do
    driven_by(:rack_test)
    sign_in user
  end

  it "詳細画面に情報が表示されている" do
    visit whisky_path(whisky)
    expect(page).to have_content "山崎"
    expect(page).to have_content "フルーティー"
  end
end
