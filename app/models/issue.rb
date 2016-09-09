class Issue < ActiveRecord::Base
  include PublicActivity::Common

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :reasons
  has_many :most_voted_reasons, -> { order('reasons.votes_positive DESC') }, class_name: 'Reason'
  belongs_to :user

  validates :title, presence: true, length: { minimum: 10 }
  validates :privacy_public, inclusion: { in: [0, 1, 2] }

  after_create :subscribe, :track_activity

  scope :public_issues, -> { where(privacy_public: 2) }
  scope :featured, -> { where(featured: 1) }
  scope :sorted, -> { order(id: :desc) }

  has_paper_trail :only => [:title, :description]

  def self.fetch_promoted_issue
    @fetch_promoted_issue ||= Issue.find_by(title: 'Razones para usar Reasons.club')
  end

  def self.load_issue(id, current_user, check_owner = false)
    issue = Issue.friendly.includes(:most_voted_reasons).find(id)
    return issue if issue.public? && !check_owner

    if (current_user.nil? || issue.user != current_user)
      return nil
    else
      return issue
    end
  end

  def self.load_rand_issue(issue)
    (self.public_issues - [issue]).sample
  end

  def track_activity
    self.create_activity action: 'create', owner: self.user
  end

  def subscribe
    Subscription.subscribe_to self.user, self
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
