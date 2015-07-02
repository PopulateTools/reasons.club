module IssueHelpers
  def create_issue_helper(title, privacy = nil)
    visit home_page
    page.click_link('add_new_issue')
    within(:css, '#new_issue') do
      fill_in 'issue[title]', with: title
      page.choose(privacy ? privacy : 'issue_privacy_public_2')
      click_button 'Create your Club'
    end
  end
end

RSpec.configure do |c|
  c.include IssueHelpers
end
