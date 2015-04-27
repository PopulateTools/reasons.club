class ReasonsController < ApplicationController

  before_action :set_new_reason
  before_action :load_reason, only: [:show, :update, :vote, :unvote]

  def new
    @reason = Reason.new
  end

  def create
    @reason = current_user.reasons.build(reason_params)
    # ToDo: control when we fire the notification
    UserMailer.new_reason_on_your_issue(current_user, @reason.issue, @reason.title).deliver_later
    if @result = @reason.save
      @reason.create_activity action: 'create', owner: current_user
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
    @reason.create_activity action: 'vote', owner: current_user
    # ToDo: control when we fire the notification
    UserMailer.new_vote_on_your_reason(current_user, @reason).deliver_later
    if @reason.user != @reason.issue.user
      UserMailer.new_vote_on_your_issue(current_user, @reason).deliver_later
    end
    respond_to do |format|
      format.html { redirect_to reason }
      format.js
    end
  end

  def unvote
    @reason.unliked_by current_user
    respond_to do |format|
      format.html { redirect_to reason }
      format.js
    end
  end
  
  private

    def reason_params
      params.require(:reason).permit(:title, :description, :issue_id, :for)      
    end

    def set_new_reason
      @reason = Reason.new issue: @issue
    end

    def load_reason
      # issue = Issue.friendly.find(params[:id])
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
