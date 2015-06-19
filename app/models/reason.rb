class Reason < ActiveRecord::Base

  belongs_to :issue
  belongs_to :user

  accepts_nested_attributes_for :issue

  acts_as_votable
  has_paper_trail :only => [:title, :description]
  include PublicActivity::Common

  # validates :user_id, presence: true
  
  before_validation :set_public_id
  after_create :subscribe

  scope :sorted, -> { order(date: :desc) }
  scope :most_voted_first, -> { order(votes_positive: :desc) }
   
  def self.for
    where('for' => true)
  end

  def self.against
    where('for' => false)
  end

  def set_public_id
    last_reason = self.issue.reasons.last
    if last_reason.present?
      self.public_id = last_reason.public_id + 1
    else
      self.public_id = 1
    end
  end

  # ToReview: we have an exact method in reasons_controller.rb - where we should put it? 
  def subscribe
    unless self.user.subscriptions.where(:issue => self.issue).any?
      Subscription.create user: self.user, issue: self.issue
    end
  end

  

end
