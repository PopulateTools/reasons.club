require 'rails_helper'

RSpec.describe QueuedNotification, type: :model do
  let(:user) { create_user }
  let(:issue) { create_issue(user: create_user(email: 'fernando@populate.tools')) }

  describe '.process_queued' do
    it 'should process only hourly subscriptions' do
      Subscription.subscribe_to user, issue
      reason = create_reason_for issue: issue, user: issue.user, title: 'Wadus wadus'

      qn = QueuedNotification.last

      QueuedNotification.process_queued Subscription.email_subscription_modes[:hourly]

      qn.reload
      expect(qn.delivered).to be true


      open_last_email_for user.email
      email = current_email
      expect(email).to have_body_text(/New reason Wadus wadus in the club Reasons to eat Cachopo everyday/)
    end

    it 'should not process daily subscriptions' do
      Subscription.subscribe_to user, issue
      reason = create_reason_for issue: issue, user: issue.user, title: 'Wadus wadus'

      qn = QueuedNotification.last

      QueuedNotification.process_queued Subscription.email_subscription_modes[:daily]

      qn.reload
      expect(qn.delivered).to be false

      expect(ActionMailer::Base.deliveries.length).to eq(0)
    end

  end
end
