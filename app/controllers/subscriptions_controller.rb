class SubscriptionsController < ApplicationController

  ## Subscribe a user to an Issue ##
  # By default, she will receive individual email notifications on each issue

  # subscribe(current_user, @issue, live|hour|day)
  # notify(current_user, activity, @issue) 

  # def update
  #   if @reason.update_attributes reason_params
  #     respond_to do |format|
  #       format.html { redirect_to '' }
  #       format.json { respond_with_bip(@reason) }
  #     end
  #   end
  # end 

  private

    def subscription_params
      params.require(:subscription).permit(:type, :issue_id)      
    end



end
