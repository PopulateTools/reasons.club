class Reason < ActiveRecord::Base

  belongs_to :issue

  acts_as_votable

end
