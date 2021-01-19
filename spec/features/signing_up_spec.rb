require 'rails_helper'

RSpec.feature 'Signing up', type: :feature do
  before do
    visit root_path
    click_link 'Sign up'
  end

  scenario 'with valid details' do
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("You have signed up successfully.")
  end

  scenario 'with blank password' do
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: ''
    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end

  scenario 'without matching password confirmation' do
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'something else'
    click_button 'Sign up'
    expect(page).to have_content("doesn't match")
  end

  scenario "with password that's too short" do
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'abc'
    fill_in 'Password confirmation', with: 'abc'
    click_button 'Sign up'
    expect(page).to have_content("too short")
  end
end
