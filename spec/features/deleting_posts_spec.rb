require 'rails_helper'

RSpec.feature "Deleting posts", type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let!(:post) { FactoryBot.create(:post, user: user) }

  before do
    login_as(user)
    visit user_path(user)
  end

  scenario 'successfully' do
    accept_alert do
      click_link "delete-#{post.id}"
    end
    expect(page).to_not have_content("This is a post.")
  end
end
