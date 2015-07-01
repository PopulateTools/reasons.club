require 'rails_helper'

RSpec.feature 'Create an Issue ' do

  scenario 'a user should log with twitter before creating an issue' do
    create_issue('Should I stay or should I go now?')
    expect(page).to have_content("You need to sign in or sign up before continuing.") 
  end

  scenario 'a logged user can create a public Issue and then view its page' do
    create_session
    create_issue('Reasons to eat Cachopo everyday', 'issue_privacy_public_2')
    expect(page).to have_content("Hooray, your Club has been created. Time to start reasoning") 
    expect(page).to have_content('Reasons to eat Cachopo everyday') 
  end

  private 

  def create_issue(title, privacy = nil)
    visit home_page
    page.click_link('add_new_issue')
    
    expect(page).to have_content('Set up your Club') 
    within(:css, '#new_issue') do
      fill_in 'issue[title]', with: title
      page.choose(privacy ? privacy : 'issue_privacy_public_2')
      click_button 'Create your Club'
    end
  end

end