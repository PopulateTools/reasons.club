class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_new_invite

  # http_basic_authenticate_with name: "reasons", password: "wadusclub" if Rails.env.production?

  private 

    def set_new_invite
      @invite = Invite.new
    end
  

end
