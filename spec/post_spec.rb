require 'rails_helper'

# frozen_string_literal: true

describe Post, type: :model do
  let(:author_1) { User.create(name: 'John', photo: 'photo_url', bio: 'A bio') }

  subject { Post.create(
    author: author_1.id,
    title: 'Hello there',
    text: 'This is an amazing story',
    comments_counter: 1, 
    likes_counter: 0, 
    created_at: '2023-10-26', 
    updated_at: '2023-10-26'
    ) }

  describe 'validations' do
    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid if title exceeds 250 characters' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end

    it 'is not valid if comments_counter is not an integer' do
      subject.comments_counter = 'string'
      expect(subject).to_not be_valid
    end

    it 'is not valid if comments_counter is less than 0' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'is not valid if likes_counter is not an integer' do
      subject.likes_counter = 'string'
      expect(subject).to_not be_valid
    end

    it 'is not valid if likes_counter is less than 0' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end
end
