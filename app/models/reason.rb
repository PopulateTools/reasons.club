class Reason < ActiveRecord::Base

  belongs_to :issue
  belongs_to :user

  accepts_nested_attributes_for :issue

  acts_as_votable
  has_paper_trail
  include PublicActivity::Common

  # validates :user_id, presence: true
  
  before_validation :set_public_id

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

end
