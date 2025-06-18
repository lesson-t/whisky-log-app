require 'rails_helper'

RSpec.describe "Unauthorized Access", type: :system do
  let!(:whisky) { create(:whisky) }

  it "redirects non-logged-in users from new page" do
    visit new_whisky_path
    expect(current_path).to eq new_user_session_path
  end

  it "redirects from edit page" do
    visit edit_whisky_path(whisky)
    expect(current_path).to eq new_user_session_path
  end

  it "redirects from destroy action" do
    page.driver.submit :delete, whisky_path(whisky), {}
    expect(current_path).to eq new_user_session_path
  end
end
