require 'rails_helper'

RSpec.feature 'Edit issue subscription mode', js: true do

  scenario 'a created issue is subscribed by the user' do
    create_session

    issue = create_issue title: 'Reasons to eat Cachopo everyday', user: @user

    visit issue_page(issue)

    expect(page).to have_content('Reasons to eat Cachopo everyday')
    expect(page).to have_content('Following Hourly')

    click_link 'Following Hourly'
    click_link 'Following Live notifications Receive them as they happen'

    expect(page).to have_content('Following Live')

    click_link 'Following Live'
    click_link 'Stop Following'

    expect(page).to have_content('Follow')
  end
end
