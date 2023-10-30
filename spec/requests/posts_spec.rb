require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  it 'renders the index template' do
    user = create(:user)
    get user_posts_path(user)

    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:index)
    expect(response.body).to include('Lorem ipsum dolor sit amet, consectetur adipiscing elit, ')
  end
end
