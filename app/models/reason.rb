class Reason < ActiveRecord::Base

  belongs_to :issue
  belongs_to :user

  accepts_nested_attributes_for :issue

  acts_as_votable
  has_paper_trail :only => [:title, :description]
  include PublicActivity::Common

  # validates :user_id, presence: true

  before_validation :set_public_id
  after_create :subscribe, :track_create_activity
  after_update :track_update_activity

  scope :sorted, -> { order(date: :desc) }
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

  def set_public_id
    last_reason = self.issue.reasons.last
    if last_reason.present?
      self.public_id = last_reason.public_id + 1
    else
      self.public_id = 1
    end
  end

  def subscribe
    Subscription.subscribe_to self.user, self.issue
  end

  def track_create_activity
    activity = self.create_activity action: 'create', owner: self.user

    Subscription.queue_notifications_for(self.issue, activity)
  end

  def track_update_activity
    activity = self.create_activity action: 'update.description', owner: self.user

    Subscription.queue_notifications_for(self.issue, activity)
  end

  def to_param
    self.public_id.to_s
  end
end
