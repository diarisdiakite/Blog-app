require 'rails_helper'

# frozen_string_literal: true

describe Post, type: :model do
  let(:first_user) { User.create(name: 'John', photo: 'photo_url', bio: 'A bio') }

  subject { Post.create(author: first_user, title: 'Hello there', text: 'This is an amazing story') }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

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
