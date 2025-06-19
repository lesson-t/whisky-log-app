require 'rails_helper'

RSpec.describe "Whiskies", type: :system do
  let(:user) { create(:user) }

  # before do
  #   driven_by(:rack_test) # JSを使う場合は :selenium_chrome_headless に変更
  # end

  it "ウイスキー一覧が表示される" do
    sign_in user
    create(:whisky, name: "響", user: user)

    visit whiskies_path

    expect(page).to have_content '登録済みウイスキー一覧'
    expect(current_path).to eq whiskies_path
    
    expect(page).to have_content("響")
  end

  it "can be tagged with multiple tags" do
    whisky = create(:whisky, tag_list: "スモーキー, 日本")
    expect(whisky.tag_list).to include("スモーキー", "日本")
  end
end
