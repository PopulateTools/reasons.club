class IssuesController < ApplicationController
  before_action :set_new_reason, only: [:show]
  before_action :load_issue, only: [:show]
  before_action :random_issue, only: [:show]
  before_action :set_new_issue, only: [:new]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def new
  end

  def create
    @issue = current_user.issues.build(issue_params)
    if @result = @issue.save
      flash[:success] = t('issues.created')
      respond_to do |format|
        format.html { redirect_to @issue }
        format.js
      end
    else
      render 'new'
    end
  end

  def index
    @issues = Issue.friendly.all
    @promoted_issue = Issue.find_by_title 'Razones para usar Reasons.club'
  end

  def show
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :description, :locale, :privacy_public, :user)
  end

  def load_issue
    # @issue = Issue.friendly.includes(reasons: [:user]).find(params[:id])
    @issue = Issue.friendly.includes(:most_voted_reasons).find(params[:id])
    @votes = issue_total_votes(@issue)
    if user_signed_in?
      @subscription = current_user.subscriptions.find_by issue: @issue
    end
    # votes = { for: 0, against: 0}
    # @votes = votes
  end

  def set_new_reason
    @reason = Reason.new issue: @issue
  end

  def set_new_issue
    @issue = Issue.new
  end

  def load_issue
    # @issue = Issue.friendly.includes(reasons: [:user]).find(params[:id])
    @issue = Issue.friendly.includes(:most_voted_reasons).find(params[:id])
    @votes = { for: @issue.votes_for, against: @issue.votes_against }
  end

  def random_issue
    offset = rand(Issue.public_issues.count)
    @rand_issue = Issue.offset(offset).first
  end
end
