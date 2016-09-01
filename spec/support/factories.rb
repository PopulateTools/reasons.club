module Factories

  def create_user(attrs = {})
    attrs[:name]      ||= "Henry Felguerosu"
    attrs[:email]     ||= "henry@felguer.oso"
    attrs[:twitter_handle] ||= "henry"
    attrs[:password] ||= "marlo"
    User.create!(attrs)
  end 

  def create_identity(attrs = {})
    attrs[:uid] ||= "12355"
    attrs[:provider] ||= "twitter"
    Identity.create!(attrs)
  end

  def mock_omniauth_login(attrs = {})
    attrs[:name]      ||= "Henry Felguerosu"
    attrs[:uid]     ||= "12355"
    attrs[:nickname] ||= "henry"
    omniauth_hash = {
      'provider' => 'twitter',
      'uid' => attrs[:uid],
      'info' => {
        'nickname' => attrs[:nickname],
        'email' => 'henry@felguer.oso'},
      'extra' => {
        'raw_info' => {'name' => attrs[:name]}
      }
    }
    OmniAuth.config.add_mock(:twitter, omniauth_hash)
  end

  def create_issue(attrs = {})
    attrs[:title] ||= "Reasons to eat Cachopo everyday"
    attrs[:user]  ||= create_user
    Issue.create!(attrs)
  end

  def create_reason_for(attrs = {})
    attrs[:title] ||= "Real men eat Cachopo."
    attrs[:issue]  ||= create_issue
    attrs[:user]  ||= create_user
    attrs[:for]  ||= true
    Reason.create!(attrs)
  end

  def create_reason_against(attrs = {})
    attrs[:title] ||= "If you are a margarito, it will hurt you."
    attrs[:issue]  ||= create_issue
    attrs[:user]  ||= create_user
    attrs[:for]  ||= false
    Reason.create!(attrs)
  end

end
