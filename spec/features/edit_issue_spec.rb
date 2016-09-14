require 'rails_helper'

RSpec.feature 'Edit an Issue ' do

  scenario 'Edit issue by the owner', js: true do
    create_session
    issue = create_issue title: 'Eat 5 vegetables every day', user: @user

    visit issue_page(issue)
    expect(page).to have_content('Eat 5 vegetables every day')
    expect(page).to have_css('i.fa-lock', visible: true)
    find(".show_edit").hover
    expect(page).to have_content("Edit")
    click_link "Edit"
    fill_in 'issue[title]', with: 'Issue title updated'
    fill_in 'issue[tag_list]', with: 'tag 1, tag 2, tag 3'
    page.choose('issue_privacy_public_2')
    click_button 'Update your Club'

    expect(page).to have_content('Issue title updated')
    expect(page).to have_content('Hooray, your Club has been updated.')
    expect(page).to_not have_css('i.fa-lock', visible: true)
    expect(page).to have_content('#tag 1')
    expect(page).to have_content('#tag 2')
    expect(page).to have_content('#tag 3')
  end

  scenario "Visit other's issue", js: true do
    create_session
    user = create_user name: 'Fernando', email: 'ferblape@gmail.com'
    issue = create_issue title: 'Eat 5 vegetables every day', user: user, privacy_public: 2

    visit issue_page(issue)
    expect(page).to have_content('Eat 5 vegetables every day')
    expect(page).to_not have_css(".edit_issue")
    expect(page).to_not have_content("Edit")
  end
end
