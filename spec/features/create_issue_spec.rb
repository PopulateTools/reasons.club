require 'rails_helper'

RSpec.feature 'Create an Issue ' do

  scenario 'create an issue button goes to right page' do
    visit home_page
    page.click_link('add_new_issue')
    expect(page).to have_content('Set up your Club') 
  end

  scenario 'a user should log with twitter before creating an issue' do
    create_issue_helper('Should I stay or should I go now?')
    expect(page).to have_content("You need to sign in or sign up before continuing.") 
  end

  scenario 'a logged user can create a public Issue and then view its page' do
    create_session
    create_issue_helper('Reasons to eat Cachopo everyday', 'issue_privacy_public_2')
    expect(page).to have_content("Hooray, your Club has been created. Time to start reasoning") 
    expect(page).to have_content('Reasons to eat Cachopo everyday') 
  end

end