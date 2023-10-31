require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'renders the index template' do
      get users_path
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(response.body).to include('Username 1')
    end

    it 'renders the show template' do
      user = create(:user)
      get user_path(user)

      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:show)
      expect(response.body).to include('Lorem ipsum dolor sit amet, consectetur adipiscing elit, ')
    end
  end
end
