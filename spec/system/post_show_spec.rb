require 'rails_helper'

RSpec.describe 'Posts/Show', type: :system do
  before do
    driven_by(:rack_test)
  end
  describe 'show page' do
    let(:user) { User.create(name: 'Dada C', bio: 'Best student from Turkish', photo: 'https://my-picture', posts_counter: 1) }
    let!(:post) { user.posts.create(title: 'first post', text: 'This is my first post.', author_id: user.id) }
    let!(:comment) { post.comments.create(text: 'Comment1', post_id: post.id, user_id: user.id) }
    it "I can see the post's title." do
      visit user_post_path(user.id, post.id)
      expect(page).to have_content(post.title)
    end
    it 'I can see who wrote the post.' do
      visit user_post_path(user.id, post.id)
      expect(page).to have_content(post.author.name)
    end
    it 'I can see how many comments it has.' do
      visit user_post_path(user.id, post.id)
      expect(page).to have_content(post.comments_counter)
    end
    it 'I can see how many likes it has.' do
      visit user_post_path(user.id, post.id)
      expect(page).to have_content(post.likes_counter)
    end
    it 'I can see the post body.' do
      visit user_post_path(user.id, post.id)
      expect(page).to have_content(post.text)
    end
    it 'I can see the username of each commentor.' do
      visit user_post_path(user.id, post.id)
      post.comments.each do |comment|
        expect(page).to have_content(comment.user.name)
      end
    end

    it 'I can see the comment each commentor left.' do
      visit user_post_path(user.id, post.id)
      post.comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end
  end
end
