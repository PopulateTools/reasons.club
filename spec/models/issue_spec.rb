require 'rails_helper'

RSpec.describe Issue, type: :model do
  let(:user) { create_user }

  it 'owner gets subscribed to the issue when created' do
    issue = create_issue user: user

    subscription = issue.subscriptions.by_user(user).first
    expect(subscription).to be_present
    expect(subscription.issue).to eq(issue)
  end

  it 'creation records an activity' do
    issue = create_issue user: user


    activities = PublicActivity::Activity.order(created_at: :desc).where(owner: user)
    expect(activities.length).to eq(1)
    activity = activities.first
    expect(activity.key).to eq('issue.create')
    expect(activity.trackable).to eq(issue)
  end

end
