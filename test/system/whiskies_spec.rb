require 'rails_helper'

RSpec.describe "Whiskies", type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    driven_by(:rack_test)
    sign_in user
  end

  it "一覧に表示される" do
    FactoryBot.create(:whisky, name: "山崎", user: user)

    visit whiskies_path
    expect(page).to have_content("山崎")
  end
end