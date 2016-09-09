class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_new_invite

  helper_method :current_user?

  def after_sign_in_path_for(resource)
    user_profile_path
  end

   def current_user?(user)
    user_signed_in? && user == current_user
  end

  private

  def set_new_invite
    @invite = Invite.new
  end

end
