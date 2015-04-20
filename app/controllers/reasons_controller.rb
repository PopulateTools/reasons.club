class ReasonsController < ApplicationController

  before_action :set_new_reason
  before_action :load_reason, only: [:show, :vote, :unvote]

  def new
    @reason = Reason.new
  end

  def create
    @reason = current_user.reasons.build(reason_params)
    if @result = @reason.save
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
      issue = Issue.friendly.find(params[:id])
      @reason = Reason.find_by(public_id: params[:public_id], issue: issue)
    end

end
