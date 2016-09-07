require 'rails_helper'

RSpec.feature 'Issue visiting' do

  scenario 'Visit an issue with reasons', js: true do
    create_session
    issue = create_issue title: 'Eat 5 vegetables every day', user: @user
    create_reason_for issue: issue, user: @user, title: "It's healthy"
    create_reason_for issue: issue, user: @user, title: "It's delicious"
    create_reason_against issue: issue, user: @user, title: "You have to go to the supermarket everyday"

    visit issue_page(issue)
    expect(page).to have_content('Eat 5 vegetables every day')
    expect(page).to have_content("It's healthy #1")
    expect(page).to have_content("It's delicious #2")
    expect(page).to have_content("You have to go to the supermarket everyday #3")
  end

  scenario 'Visit a private issue which is mine', js: true do
    create_session
    issue = create_issue title: 'Eat 5 vegetables every day', user: @user

    visit issue_page(issue)
    expect(page).to have_content('Eat 5 vegetables every day')
  end

  scenario 'As a logged user, visit a private issue which is not mine', js: true do
    create_session
    user = create_user name: 'Fernando', email: 'ferblape@gmail.com'
    issue = create_issue title: 'Eat 5 vegetables every day', user: user

    visit issue_page(issue)
    expect(page).to_not have_content('Eat 5 vegetables every day')
    expect(current_path).to eq('/')
  end

  scenario 'As an anonymous user, visit a private issue which is not mine', js: true do
    issue = create_issue title: 'Eat 5 vegetables every day'

    visit issue_page(issue)
    expect(page).to_not have_content('Eat 5 vegetables every day')
    expect(current_path).to eq('/')
  end
end
