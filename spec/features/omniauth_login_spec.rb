require 'rails_helper'

RSpec.feature 'OmniAuth ' do

   
  scenario 'login existing user with twitter' do
    create_session
    #Signed in suscesfully???
    expect(page).to have_content('@henry Henry Felguerosu')
  end

  scenario 'create and login a user with twitter successfully' do
    create_new_twitter_user
    #Signed in suscesfully???
    expect(page).to have_content('@henry Henry Felguerosu')
  end

  scenario 'should create, login and logout successfully' do
    create_new_twitter_user
    page.click_link('', :href => '/login/logout')
    #Signed out successfully.
    expect(page).to have_content('Connect with') 
  end

end