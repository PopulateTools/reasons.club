class Reason < ActiveRecord::Base

  belongs_to :issue
  belongs_to :user

  accepts_nested_attributes_for :issue

  acts_as_votable
  has_paper_trail :only => [:title, :description]
  include PublicActivity::Common

  # validates :user_id, presence: true

  before_validation :set_public_id
  after_create :subscribe_reason_owner, :track_create_activity
  after_update :track_update_activity

  scope :sorted, -> { order(id: :desc) }
  scope :most_voted_first, -> { order(votes_positive: :desc) }

  validates :public_id, uniqueness: { scope: :issue_id }

  def self.for
    where('for' => true)
  end

  def self.against
    where('for' => false)
  end

  def self.find_by_param(public_id)
    find_by!(public_id: public_id)
  end

  def to_param
    self.public_id.to_s
  end

  private

  def set_public_id
    max_public_id = self.issue.reasons.maximum('public_id')
    if max_public_id.present?
      self.public_id = max_public_id + 1
    else
      self.public_id = 1
    end
  end

  def subscribe_reason_owner
    Subscription.subscribe_to self.user, self.issue
  end

  def track_create_activity
    activity = self.create_activity action: 'create', owner: self.user

    Subscription.queue_notifications_for(self.issue, activity)
  end

  def track_update_activity
    activity = self.create_activity action: 'update', owner: self.user

    Subscription.queue_notifications_for(self.issue, activity)
  end
end
