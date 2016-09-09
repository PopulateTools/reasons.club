class IssuesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :load_owner_issue, only: [:edit, :update]

  def new
    @issue = Issue.new
  end

  def create
    @issue = current_user.issues.build(issue_params)
    if @issue.save
      flash[:success] = t('issues.created')
      redirect_to @issue
    else
      render 'new'
    end
  end

  def index
    @issues = Issue.public_issues.featured.sorted
    @promoted_issue = Issue.fetch_promoted_issue
  end

  def show
    unless @issue = Issue.load_issue(params[:id], current_user, false)
      redirect_to(root_path) and return false
    end

    @rand_issue = Issue.load_rand_issue(@issue)

    @votes = { for: @issue.votes_for, against: @issue.votes_against }

    @subscription = user_signed_in? and current_user.subscriptions.by_issue(@issue).first
  end

  def edit
  end

  def update
    success = @issue.update_attributes issue_params
    respond_to do |format|
      format.html do
        if success
          flash[:success] = t('issues.updated')
          redirect_to @issue
        else
          render 'edit'
        end
      end
      format.json do
        render json: @issue.to_json
      end
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :description, :locale, :privacy_public)
  end

  def load_owner_issue
    unless @issue = Issue.load_issue(params[:id], current_user, true)
      redirect_to(root_path) and return false
    end
  end
end
