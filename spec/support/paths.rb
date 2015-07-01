module Paths
  def home_page
    locale_preffix + '/'
  end

  def user_page(user)
    locale_preffix + "/users/#{user.id}"
  end

  def login_page
    locale_preffix + "/login"
  end

  private

  def locale_preffix
    ''
    #"/en"
  end
end
