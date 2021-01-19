require 'rails_helper'

RSpec.feature 'Creating posts', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(user)
    visit new_post_path
  end

  scenario 'with a title' do
    fill_in 'Title', with: 'Test Post'
    fill_in 'Say something...', with: 'This is a post with a title.'
    click_button 'Post'

    expect(page).to have_content('Test Post')
    expect(page).to have_content('This is a post with a title.')
  end

  scenario 'without a title' do
    fill_in 'Say something...', with: 'This is a post without a title.'
    click_button 'Post'

    expect(page).to have_content('This is a post without a title.')
  end
end
