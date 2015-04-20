class Issue < ActiveRecord::Base

  has_many :reasons
  belongs_to :user
  
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true, length: { minimum: 10 }

  scope :public_issues, -> { where(privacy_public: 2) }
  scope :featured, -> { where(featured: 1) }

end