class Issue < ActiveRecord::Base

  has_many :reasons
  belongs_to :user
  
  extend FriendlyId
  friendly_id :title, use: :slugged

  

end
