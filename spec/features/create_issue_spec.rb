require 'rails_helper'

RSpec.feature 'Create an Issue ' do

  scenario 'should log with twitter first' do
    visit home_page
    page.click_link('', :href => '/issues/new')
    expect(page).to have_content('Connect with Twitter to become a Reasoner') 
  end

  scenario 'should create a public Issue and then go to its page' do
    create_session
    my_club_title = 'Should I stay or should I go now?'
    
    visit home_page
    page.click_link('', :href => '/issues/new')
    
    expect(page).to have_content('Set up your Club') 
    within(:css, '#new_issue') do
      fill_in 'issue[title]', with: my_club_title
      page.choose('issue_privacy_public_2')
      click_button 'Create your Club'
    end
    expect(page).to have_content("Hooray, your Club has been created. Time to start reasoning") 
    expect(page).to have_content(my_club_title) 
  end

end