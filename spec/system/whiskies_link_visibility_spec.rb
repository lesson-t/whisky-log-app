# frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe "Whisky Link Visibility", type: :system do
#   let(:owner) { create(:user) }
#   let(:other_user) { create(:user) }
#   let!(:whisky) { create(:whisky, user: owner, name: "響") }

#   context "when logged in as the owner" do
#     before do
#       sign_in owner
#       visit whiskies_path
#       expect(page).to have_content "登録済みウイスキー一覧" # レンダリング確認
#     end

#     it "shows edit/delete for owner's post" do
#       within("tr", text: "響") do
#         expect(page).to have_link("編集", href: edit_whisky_path(whisky))
#         expect(page).to have_link("削除", href: whisky_path(whisky))
#       end
#     end
#   end

#   context "when logged in as another user" do
#     before do
#       sign_in other_user
#       visit whiskies_path
#     end

#     it "does not show edit/delete for others' post" do
#       within("tr", text: "響") do
#         expect(page).not_to have_link("編集", href: edit_whisky_path(whisky))
#         expect(page).not_to have_link("削除", href: whisky_path(whisky))
#       end
#     end
#   end
# end
