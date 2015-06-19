class Issue < ActiveRecord::Base

  has_many :reasons
  has_many :most_voted_reasons, -> { order('reasons.votes_positive DESC') }, class_name: 'Reason'
  # Issue.includes(:most_voted_reasons) 

  belongs_to :user
  
  extend FriendlyId
  friendly_id :title, use: :slugged

  include PublicActivity::Common
  
  validates :title, presence: true, length: { minimum: 10 }
  after_create :subscribe

  scope :public_issues, -> { where(privacy_public: 2) }
  scope :featured, -> { where(featured: 1) }

  # ToReview: we have an almost exact method in reasons_controller.rb, reason.rb... - where we should put it? 
  def subscribe
    unless self.user.subscriptions.where(:issue => self).any?
      Subscription.create user: self.user, issue: self
    end
  end

end