class ReasonsController < ApplicationController

  before_action :set_new_reason
  before_action :load_reason, only: [:show, :vote, :unvote]

  def new
    logger.info 'si entra reason path'
    @reason = Reason.new
  end

  def create
    @reason = current_user.reasons.build(reason_params)
    # ToDo: control when we fire the notification
    UserMailer.new_reason_on_your_issue(current_user, @reason.issue).deliver_later
    if @result = @reason.save
      @reason.create_activity action: 'create', owner: current_user
      respond_to do |format|
        format.html { redirect_to @reason }
        format.js
      end
    end
  end

  def show
    # @reason = Reason.friendly.find(params[:id]).where(public_id: params[:public_id])
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

end
