class ActivitiesController < ApplicationController

  def index
    @activities = PublicActivity::Activity.order(created_at: :desc) #.where owner: current_user
  end

  private



end
