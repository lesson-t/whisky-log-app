# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tag search', type: :request do
  let(:user) { create(:user) }
  let!(:whisky) { create(:whisky, user: user, tag_list: 'アイラ') }

  before do
    sign_in user
  end

  it 'renders tagged index page successfully' do
    get tag_path('アイラ')
    expect(response).to have_http_status(:success)
    expect(response.body).to include('アイラ')
  end
end
