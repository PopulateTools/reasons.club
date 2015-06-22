class SubscriptionsController < ApplicationController

  ## Subscribe a user to an Issue ##
  # By default, she will receive individual email notifications on each issue

  before_action :load_subscription, only: [:update]

  def update
    if @subscription.update_attributes subscription_params
      respond_to do |format|
        format.html { redirect_to '' }
        format.js
      end
    end
  end 

  private

    def subscription_params
      params.require(:id).permit(:email_subscription_mode)
    end

    def load_subscription
      @subscription = Subscription.find(params[:id])
    end


end
