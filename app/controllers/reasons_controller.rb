class ReasonsController < ApplicationController

  before_action :set_new_reason
  before_action :load_reason, only: [:show, :update, :vote, :unvote]
  before_action :authenticate_user!, only: [:create, :update, :vote, :unvote]
  
  def new
    @reason = Reason.new
  end

  def create
    @reason = current_user.reasons.build(reason_params)
    if @result = @reason.save
      activity = @reason.create_activity action: 'create', owner: current_user
      # ToReview: I was putting this on the model, but how would we access activity from there?
      # queue_notification(current_user, activity)
      queue_notification_for_subscribers(@reason.issue, activity)
      respond_to do |format|
        format.html { redirect_to @reason }
        format.js
      end
    end
  end

  def edit
  end

  def update
    if @reason.update_attributes reason_params
      # ToDo: when we let update more than description, control which activity we have
      # ToDo: control if we have just made an edit (ie. in the last 2h?)
      @reason.create_activity action: 'update.description', owner: current_user
      respond_to do |format|
        format.html { redirect_to '' }
        format.json { respond_with_bip(@reason) }
      end
    end
  end 

  def show
    @contributors = reason_description_contributors(@reason)
    respond_to do |format|
      format.html { redirect_to '' }
      format.js
    end
  end

  def vote
    @reason.liked_by current_user
    activity = @reason.create_activity action: 'vote', owner: current_user
    subscribe(current_user, @reason.issue)
    # Notification for issue subscribers
    queue_notification_for_subscribers(@reason.issue, activity)
    # UserMailer.new_vote_on_your_reason(current_user, @reason).deliver_later
    Reason.update_counters(@reason, votes_positive: +1)
    respond_to do |format|
      format.html { redirect_to reason }
      format.js
    end
  end

  def unvote
    @reason.unliked_by current_user
    Reason.update_counters(@reason, votes_positive: -1)
    respond_to do |format|
      format.html { redirect_to reason }
      format.js
    end
  end
  
  private

    def subscribe(user, issue)
      unless user.subscriptions.where(:issue => issue).any?
        Subscription.create user: user, issue: issue
      end
    end

    def queue_notification(user, activity)
      # ToReview: should we just save the object id from the activity? If so, we should also change field type
      Queued_Notification.create user: user, notification: activity.id, period: user[:email_subscription_mode], status: 0
    end

    def queue_notification_for_subscribers(issue, activity)
      # ToReview,ToDo: Write the query with include so we generate less queries
      # ToDo: Avoid creating notification if the issue owner is the one doing the action (new reason, new vote)
      Subscription.where(issue: issue).where.not(user: current_user).each do |subscription|
        queue_notification(subscription.user, activity)
      end
    end

    def reason_params
      params.require(:reason).permit(:title, :description, :issue_id, :for)      
    end

    def set_new_reason
      @reason = Reason.new issue: @issue
    end

    def load_reason
      @reason = Reason.find(params[:id])
    end

    def reason_description_contributors(reason)
      contributors = []
      reason.versions.select("DISTINCT(whodunnit), *").each do |reason|
        unless contributors.include? reason.whodunnit
          contributors.push reason.whodunnit
        end
      end
      contributors
    end

end
