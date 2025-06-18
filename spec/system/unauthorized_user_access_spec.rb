require 'rails_helper'

RSpec.describe "Unauthorized Access by Logged-In User", type: :system do
  let(:owner) { create(:user) }
  let(:other_user) { create(:user) }
  let!(:whisky) { create(:whisky, user: owner) }

  before do
    login_as(other_user, scope: :user)
  end

  it "redirects from edit page" do
    visit edit_whisky_path(whisky)
    expect(current_path).to eq root_path # または forbidden ページ
  end

  it "does not allow destroy" do
    page.driver.submit :delete, whisky_path(whisky), {}
    expect(page).to have_current_path(root_path)
    expect(Whisky.exists?(whisky.id)).to be true
  end
end
