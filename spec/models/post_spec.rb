require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { FactoryBot.create(:user) }
  subject { user.posts.build(content: 'This is a post.') }

  context 'content and user ID are present' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'content is missing' do
    it 'is not valid' do
      subject.update(content: '')
      expect(subject.errors).to have_key(:content)
    end
  end

  context 'user ID is missing' do
    it 'is not valid' do
      subject.update(user_id: nil)
      expect(subject.errors).to have_key(:user_id)
    end
  end
end
