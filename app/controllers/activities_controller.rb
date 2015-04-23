class ActivitiesController < ApplicationController

  def index
    @activities = PublicActivity::Activity.all #.where owner: current_user
  end

  private



end
