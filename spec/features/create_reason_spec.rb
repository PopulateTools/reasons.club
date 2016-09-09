require 'rails_helper'

RSpec.feature 'Create a Reason in a Issue ' do
  background do
    create_session
    issue_creator = create_user email: 'fernando@populate.tools', twitter_handle: 'ferblape'
    issue = create_issue(title: 'Reasons to eat Cachopo everyday', privacy_public: 2, user: issue_creator)
    visit issue_page(issue)
  end

  scenario 'should create "for" Reasons, see them, and increase counter', js: true do
    expect(page).to have_content('0 REASONS FOR')
    create_reason_helper(:for, 'Improve my opinions in a structured way')
    expect(page).to have_content('Reason added! Broadcast your mind, check what others think')
    expect(page).to have_content('Follow')

    sleep 3

    expect(page).not_to have_content('Reason added! Broadcast your mind, check what others think')
    expect(page).to have_content('Improve my opinions in a structured way')
    expect(page).to have_content('1 REASON FOR')
    expect(page).to have_content('Following Hourly')

    create_reason_helper(:for, 'Collects info from various people about the subject')
    expect(page).to have_content('Collects info from various people about the subject')
    expect(page).to have_content('2 REASONS FOR')
    expect(page).to have_content('Following Hourly')
  end

  scenario 'should create "against" Reason, see it, and increase counter', js: true do
    expect(page).to have_content('0 REASONS AGAINST')
    create_reason_helper(:against, 'I could be eating a Cachopo right now')
    expect(page).to have_content('Reason added! Broadcast your mind, check what others think')
    expect(page).to have_content('Follow')

    sleep 3

    expect(page).not_to have_content('Reason added! Broadcast your mind, check what others think')
    expect(page).to have_content('I could be eating a Cachopo right now')
    expect(page).to have_content('1 REASON AGAINST')
    expect(page).to have_content('Following Hourly')
  end
end
