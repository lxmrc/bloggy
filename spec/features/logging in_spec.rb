require 'rails_helper'

RSpec.feature "Logging in", type: :feature do
  let!(:user) { FactoryBot.create(:user) }

  scenario "with valid credentials" do
    visit root_path
    click_link "Log in"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Log in"

    expect(page).to have_content "Signed in successfully."
  end
end
