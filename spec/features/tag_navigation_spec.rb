require 'rails_helper'

RSpec.feature 'Tag navigation' do

  scenario 'view issue tags' do
    create_session
    issue = create_issue title: 'Eat 5 vegetables every day', user: @user, tag_list: ['food','health']

    visit issue_page(issue)

    expect(page).to have_content('Eat 5 vegetables every day')
    within(:css, '.show_edit') do
      expect(page).to have_content('#food')
      expect(page).to have_content('#health')

      click_link '#food'
    end

    expect(page).to have_content('# food')
    expect(page).to have_content('Eat 5 vegetables every day')

    click_link '#all'

    expect(page).to have_content('# food')
    expect(page).to have_content('# health')
  end
end
