require 'rails_helper'

RSpec.feature 'Create an Issue ' do

  scenario 'a user should log with twitter before creating an issue' do
    visit home_page
    page.click_link('add_new_issue')

    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end

  scenario 'a logged user can create a public Issue and then view its page' do
    create_session

    visit home_page
    page.click_link('add_new_issue')

    within(:css, '#new_issue') do
      fill_in 'issue[title]', with: 'Reasons to eat Cachopo everyday'
      page.choose('issue_privacy_public_2')
      click_button 'Create your Club'
    end

    expect(page).to have_content("Hooray, your Club has been created. Time to start reasoning")
    expect(page).to have_content('Reasons to eat Cachopo everyday')
    expect(page).to have_content('Following Hourly')
  end

end
