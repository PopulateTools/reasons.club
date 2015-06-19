require 'rails_helper'

RSpec.feature 'OmniAuth login' do

   
  scenario "login existing twitter user" do
    create_session
    expect(page).to have_content('@henry Henry Felguerosu')
  end

  scenario "create and login a twitter user successfully" do
    create_new_twitter_user

    expect(page).to have_content('@henry Henry Felguerosu')
  end

  scenario "should create, login and logout successfully" do
    create_new_twitter_user
    
    page.click_link('', :href => '/login/logout')
    
    expect(page).to have_content("Connect with") 
  end

end