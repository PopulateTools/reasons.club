class InvitesController < ApplicationController

 def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.new(invite_params)
    if @result = @invite.save
      respond_to do |format|
        format.html { redirect_to @invite }
        format.js
      end
    end
  end

  private

    def invite_params
      params.require(:invite).permit(:email)      
    end

end
