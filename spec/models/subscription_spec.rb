require 'rails_helper'

RSpec.describe Subscription, type: :model do
  let(:user) { create_user }
  let(:issue) { create_issue(user: create_user(email: 'fernando@populate.tools')) }

  describe '.subscribe_to' do
    context 'when the Subscription exists' do
      before do
        Subscription.create user: user, issue: issue
      end

      it 'should return the subscription' do
        expect{
          subscription = Subscription.subscribe_to user, issue
          expect(subscription.user).to eq(user)
          expect(subscription.issue).to eq(issue)
        }.to_not change{ Subscription.count }
      end
    end

    context 'when the Subscription does not exist' do
      it 'should create a new subscription' do
        expect{
          subscription = Subscription.subscribe_to user, issue
          expect(subscription.user).to eq(user)
          expect(subscription.issue).to eq(issue)
        }.to change{ Subscription.count }
      end
    end
  end

  describe '.queue_notifications_for' do
    it 'should created queued notifications except for the owner' do
      Subscription.subscribe_to user, issue
      reason = create_reason_for issue: issue, user: issue.user, title: 'Wadus wadus'
      activity = PublicActivity::Activity.last

      expect(QueuedNotification.count).to eq(1)
      qn = QueuedNotification.last
      expect(qn.user).to eq(user)
      expect(qn.activity).to eq(activity)
      expect(qn.period).to eq('hourly')
    end
  end
end
