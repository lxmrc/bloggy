require 'rails_helper'

RSpec.feature "Users can like and unlike posts", type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let!(:post) { FactoryBot.create(:post, user: user) }

  before do
    login_as(user)
    visit user_path(user)
  end

  scenario 'successfully', js: true do
    expect(page).to have_content("0 notes")
    click_link "like-#{post.id}"
    expect(page).to have_content("1 note")
    click_link "unlike-#{post.id}"
    expect(page).to have_content("0 notes")
    click_link "like-#{post.id}"
    expect(page).to have_content("1 note")
  end

end
