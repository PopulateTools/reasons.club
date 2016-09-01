require 'rails_helper'

RSpec.feature 'Create a Reason in a Issue ' do
  background do
    create_session
    create_issue_helper('Reasons to eat Cachopo everyday', 'issue_privacy_public_2')
  end

  scenario 'should create "for" Reasons, see them, and increase counter', js: true do
    expect(page).to have_content('0 REASONS FOR')
    create_reason_helper(:for, 'Improve my opinions in a structured way')
    expect(page).to have_content('Reason added! Broadcast your mind, check what others think')
    sleep 3
    expect(page).not_to have_content('Reason added! Broadcast your mind, check what others think')
    expect(page).to have_content('Improve my opinions in a structured way')
    expect(page).to have_content('1 REASON FOR')
    create_reason_helper(:for, 'Collects info from various people about the subject')
    expect(page).to have_content('Collects info from various people about the subject')
    expect(page).to have_content('2 REASONS FOR')
  end

  scenario 'should create "against" Reason, see it, and increase counter', js: true do
    expect(page).to have_content('0 REASONS AGAINST')
    create_reason_helper(:against, 'I could be eating a Cachopo right now')
    expect(page).to have_content('Reason added! Broadcast your mind, check what others think')
    sleep 3
    expect(page).not_to have_content('Reason added! Broadcast your mind, check what others think')
    expect(page).to have_content('I could be eating a Cachopo right now')
    expect(page).to have_content('1 REASON AGAINST')
  end
end
