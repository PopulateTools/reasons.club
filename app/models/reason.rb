class Reason < ActiveRecord::Base

  belongs_to :issue
  belongs_to :user

  accepts_nested_attributes_for :issue

  acts_as_votable

  # validates :user_id, presence: true
  
  def self.for
    where('for' => true)
  end

  def self.against
    where('for' => false)
  end

end
