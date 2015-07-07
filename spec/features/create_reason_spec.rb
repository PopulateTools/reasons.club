require 'rails_helper'

RSpec.feature 'Create a Reason in a Issue ' do

  background do
    create_session
    create_issue_helper('Reasons to eat Cachopo everyday', 'issue_privacy_public_2')
  end
 
  scenario 'should create "for" Reasons and be able to see them, and the reasons counter increase', :js => true do
    expect(page).to have_content('0 REASONS FOR')
    within('div.reasons-for') {
      fill_in 'reason_title', :with => 'Improve my opinions in a structured way'
      page.execute_script("$('form#new_reason').submit()")
    }
    expect(page).to have_content('Improve my opinions in a structured way')
    expect(page).to have_content('1 REASON FOR')
    within('div.reasons-for') {
      fill_in 'reason_title', :with => 'Collects info from various people about the subject'
      page.execute_script("$('form#new_reason').submit()")
    }
    expect(page).to have_content('Collects info from various people about the subject')
    expect(page).to have_content('2 REASONS FOR')
  end 

  scenario 'should create an "against" Reason and be able to see it, and the reasons counter increase', :js => true do
    expect(page).to have_content('0 REASONS AGAINST')
    within('div.reasons-against') {
      fill_in 'reason_title', :with => 'I could be eating a Cachopo right now'
      page.execute_script("$('form#new_reason').submit()")
    }
    expect(page).to have_content('I could be eating a Cachopo right now')
    expect(page).to have_content('1 REASON AGAINST')
  end 
end