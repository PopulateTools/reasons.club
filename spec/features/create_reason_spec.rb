require 'rails_helper'

RSpec.feature 'Create a Reason in a Issue ' do

  background do
    create_session
    create_issue_helper('Reasons to eat Cachopo everyday', 'issue_privacy_public_2')
  end
  scenario 'should create a "for" Reason and be able to see it', :js => true do
    within('div.reasons-for') {
      fill_in 'reason_title', :with => 'Improve my opinions in a structured way'
      page.execute_script("$('form#new_reason').submit()")
    }
    expect(page).to have_content('Improve my opinions in a structured way')
  end 
=begin

  scenario 'should create a "against" Reason and be able to see it' do
    within('div.reasons-against') {
      fill_in 'reason_title', :with => 'I could be eating a Cachopo right now'
      click_button('Send your reason')
    }
    expect(page).to have_content('I could be eating a Cachopo right now')
  end  
=end
end