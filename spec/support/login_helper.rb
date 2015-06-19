module LoginHelpers
  def create_session
    @user = create_user 
    create_identity(user: @user)
    mock_omniauth_login
    visit '/login/auth/twitter'
  end
end

RSpec.configure do |c|
  c.include LoginHelpers
end


