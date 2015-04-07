class ReasonsController < ApplicationController

  def new
    @reason = Reason.new
  end

  def create
    @reason = Reason.new(reason_params)
    if @result = @reason.save
      respond_to do |format|
        format.html { redirect_to @reason }
        format.js
      end
    end
  end

  private

    def reason_params
      params.require(:reason).permit(:title, :description, :issue_id, :for)      
    end


end
