class IssuesController < ApplicationController

  before_action :set_new_reason, only: [:show]

  def index
    @issues = Issue.friendly.all
  end

  def show
    @issue = Issue.friendly.includes(reasons: [:user]).find(params[:id])
    @votes = issue_total_votes(@issue)
  end

  private

    def issue_total_votes(issue)
      votes = { for: 0, against: 0}
      issue.reasons.for.find_each do |reason|
        votes[:for]     += reason.votes_for.size        
      end
      issue.reasons.against.find_each do |reason|
        votes[:against  ] += reason.votes_for.size
      end
      votes
    end

    def set_new_reason
      @reason = Reason.new issue: @issue
    end


end
