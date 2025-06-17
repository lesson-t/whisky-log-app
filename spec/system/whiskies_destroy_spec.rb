require 'rails_helper'

RSpec.describe "Whiskies Destroy", type: :system, js: true do
  let(:user) { create(:user) }
  let!(:whisky) { create(:whisky, name: "余市", user: user) }

  before do
    sign_in user
    visit whiskies_path
  end

  it "削除すると一覧から消える" do
    accept_confirm do
      click_link "削除"
    end

    expect(page).not_to have_content "余市"
  end
end
