class ReasonsController < ApplicationController

  before_action :set_new_reason

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

  # def show
  #   @reason = Reason.find(params[:id])
  #   respond_to do |format|
  #     format.html { redirect_to @reason }
  #     format.js
  #   end
  # end

  private

    def reason_params
      params.require(:reason).permit(:title, :description, :issue_id, :for)      
    end

    def set_new_reason
      @reason = Reason.new issue: @issue
    end


end
