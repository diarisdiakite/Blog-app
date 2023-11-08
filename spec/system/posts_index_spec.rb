require 'rails_helper'

RSpec.describe 'User Post Index', type: :system do
  let(:user) { User.create(name: 'Dada C', bio: 'Best student from Turkish', photo: 'https://my-photo', posts_counter: 0) }
  let!(:post) { user.posts.create(title: 'My Post 1', text: 'This is my first post.') }

  before do
    user.update(posts_counter: user.posts.count)
    create_list(:comment, 5, user:)
    visit user_posts_path(user)
  end

  it "displays the user's profile picture" do
    expect(page).to have_selector("img[src='#{user.photo}']")
  end

  it "displays the user's username" do
    expect(page).to have_content(user.name)
  end

  it 'displays the number of posts the user has written' do
    expect(page).to have_content(user.posts_counter)
  end

  it "displays a post's title" do
    expect(page).to have_content(post.title)
  end

  it "displays some of the post's body" do
    expect(page).to have_content(post.text)
  end

  it 'displays the first comments on a post' do
    user.posts.first.comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end

  it 'displays how many comments a post has' do
    expect(page).to have_content(post.comments_counter)
  end

  it 'displays how many likes a post has' do
    expect(page).to have_content(post.likes_counter)
  end

  it 'displays a section for pagination if there are more posts than fit on the view' do
    expect(page).to have_content('Pagination')
  end

  it "when I click on a post, it redirects me to that post's show page" do
    click_link(post.title)
    expect(page).to have_current_path(user_post_path(user, post))
  end
end
