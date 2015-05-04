class SubscriptionsController < ApplicationController

  # subscribe(current_user, @issue, live|hour|day)
  # notify(current_user, activity, @issue) 

  def create
    @subscription = current_user.subscription.build(subscription_params)
    if @result = @subscription.save
      @reason.create_activity action: 'create', owner: current_user
      respond_to do |format|
        format.html { redirect_to @issue }
        format.js
      end
    end
  end

  def update
    if @reason.update_attributes reason_params
      respond_to do |format|
        format.html { redirect_to '' }
        format.json { respond_with_bip(@reason) }
      end
    end
  end 


  def subscribe
    @issue = Issue.new
  end


  private

    def subscription_params
      params.require(:subscription).permit(:type, :issue_id)      
    end



end
