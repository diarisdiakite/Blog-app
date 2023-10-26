require 'rails_helper'

# frozen_string_literal: true

describe Comment, type: :model do
  let(:second_user) { User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.', posts_counter: 10) }

  describe 'validations' do
    it 'is not valid without a text' do
      comment = Comment.create(post: nil, user: second_user, text: 'Hi Tom!')
      comment.text = nil
      expect(comment).not_to be_valid
    end
  end
end
