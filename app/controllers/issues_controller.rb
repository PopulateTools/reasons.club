class IssuesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :load_issue, only: [:show]

  def new
    @issue = Issue.new
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
    @issues = Issue.public_issues.featured.sorted
    @promoted_issue = Issue.fetch_promoted_issue
  end

  def show
    @reason = @issue.reasons.new
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :description, :locale, :privacy_public, :user)
  end

  def load_issue
    unless @issue = Issue.load_issue(params[:id], current_user)
      redirect_to(root_path) and return false
    end

    @votes = { for: @issue.votes_for, against: @issue.votes_against }

    if user_signed_in?
      @subscription = current_user.subscriptions.find_by issue: @issue
    end
  end
end
