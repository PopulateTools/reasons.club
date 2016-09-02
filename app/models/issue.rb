class Issue < ActiveRecord::Base

  has_many :reasons
  has_many :most_voted_reasons, -> { order('reasons.votes_positive DESC') }, class_name: 'Reason'
  # Issue.includes(:most_voted_reasons)

  belongs_to :user

  extend FriendlyId
  friendly_id :title, use: :slugged

  include PublicActivity::Common

  validates :title, presence: true, length: { minimum: 10 }
  validates :privacy_public, inclusion: { in: [0, 1, 2] }

  scope :public_issues, -> { where(privacy_public: 2) }
  scope :featured, -> { where(featured: 1) }
  scope :sorted, -> { order(id: :desc) }

  def self.fetch_promoted_issue
    @fetch_promoted_issue ||= Issue.find_by(title: 'Razones para usar Reasons.club')
  end

  def self.load_issue(id, current_user)
    issue = Issue.friendly.includes(:most_voted_reasons).find(id)
    return issue if issue.public?

    if (current_user.nil? || issue.user != current_user)
      return nil
    else
      return issue
    end
  end

  def votes_for
    reasons.for.sum(:votes_positive)
  end

  def votes_against
    reasons.against.sum(:votes_positive)
  end

  def private?
    privacy_public == 0
  end

  def public?
    privacy_public == 2
  end

end
