module LoginHelpers
  def create_session
    @user = create_user 
    create_identity(user: @user)
    mock_omniauth_login
    visit '/login/auth/twitter'
  end

  def create_new_twitter_user
    mock_omniauth_login
    visit '/login/auth/twitter'
    fill_in 'Email', with: 'henry@felguer.oso'
    click_button 'Continue'
  end
end

RSpec.configure do |c|
  c.include LoginHelpers
end


