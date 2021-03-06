class ReasonsController < ApplicationController

  before_action :load_issue, only: [:create, :update, :vote, :unvote, :show]
  before_action :load_owner_reason, only: [:update]
  before_action :load_reason, only: [:vote, :unvote, :show]
  before_action :authenticate_user!, only: [:create, :update, :vote, :unvote]

  def new
    @reason = Reason.new
  end

  def create
    @reason = current_user.reasons.build(reason_params)
    @reason.issue = @issue

    if @result = @reason.save
      @subscription = current_user.subscriptions.by_issue(@issue).first
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
      respond_to do |format|
        format.html { redirect_to '' }
        format.json { respond_with_bip(@reason) }
      end
    end
  end

  def show
    @contributors = reason_description_contributors(@reason)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def vote
    @reason.liked_by current_user

    @subscription = Subscription.subscribe_to current_user, @reason.issue

    # Notification for issue subscribers
    activity = @reason.create_activity action: 'vote', owner: current_user
    Subscription.queue_notifications_for(@reason.issue, activity)

    @argument = @reason.for ? :for : :against
    Reason.update_counters(@reason, votes_positive: +1)
    respond_to do |format|
      format.html { redirect_to reason }
      format.js
    end
  end

  def unvote
    @reason.unliked_by current_user
    @argument = @reason.for ? :for : :against
    Reason.update_counters(@reason, votes_positive: -1)
    respond_to do |format|
      format.html { redirect_to reason }
      format.js
    end
  end

  private

    def reason_params
      params.require(:reason).permit(:title, :description, :for)
    end

    def load_issue
      unless @issue = Issue.load_issue(params[:issue_id], current_user, false)
        redirect_to(root_path) and return false
      end
    end

    def load_owner_reason
      @reason = @issue.reasons.find_by_param(params[:id])
      if current_user.nil? || @reason.user != current_user
        redirect_to(root_path) and return false
      end
    end

    def load_reason
      @reason = @issue.reasons.find_by_param(params[:id])
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
