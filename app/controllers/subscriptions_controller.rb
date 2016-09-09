class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_subscription, except: [:create]

  def create
    issue = Issue.load_issue(params[:issue_id], current_user, false)
    @subscription = current_user.subscriptions.new issue: issue
    @subscription.save!
    respond_to do |format|
      format.js { render 'update' }
    end
  end

  def update
    if @subscription.update_attributes subscription_params
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @subscription.destroy
    respond_to do |format|
      format.js { render 'update' }
    end
  end

  private

  def subscription_params
    params.permit(:email_subscription_mode)
  end

  def load_subscription
    @subscription = current_user.subscriptions.find(params[:id])
    @issue = @subscription.issue
  end

end
