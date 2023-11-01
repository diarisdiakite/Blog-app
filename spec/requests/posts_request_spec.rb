require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  it 'renders the index template' do
    user = create(:user)
    get user_posts_path(user)

    expect(response.status).to eq(200)
    expect(response).to render_template(:index)
    expect(response.body).to include('Lorem ipsum dolor sit amet, consectetur adipiscing elit, ')
  end

  it 'renders the show template' do
    user = create(:user)
    post = create(:post, author: user)
    get user_post_path(user, post)

    expect(response.status).to eq(200)
    expect(response).to render_template(:show)
    expect(response.body).to include('Lorem ipsum dolor sit amet, consectetur adipiscing elit, ')
  end
end
