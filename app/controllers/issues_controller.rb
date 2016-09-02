class IssuesController < ApplicationController

  before_action :load_issue, only: [:show]
  before_action :set_new_reason, only: [:show]
  before_action :random_issue, only: [:show]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def new
    @issue = Issue.new
  end

  def create
    @issue = current_user.issues.build(issue_params)
    if @result = @issue.save
      # load_issue
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
  end

  def update
    @issue.update_attributes issue_update_params
    respond_to do |format|
      format.html { redirect_to @issue }
      format.json do
        render json: @issue.to_json
      end
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :description, :locale, :privacy_public)
  end

  def issue_update_params
    params.require(:issue).permit(:title, :privacy_public)
  end

  def set_new_reason
    @reason = @issue.reasons.new
  end

  def load_issue
    unless @issue = Issue.load_issue(params[:id], current_user)
      redirect_to(root_path) and return false
    end

    @votes = { for: @issue.votes_for, against: @issue.votes_against }
  end

  def random_issue
    @rand_issue = Issue.public_issues.sample
  end
end
