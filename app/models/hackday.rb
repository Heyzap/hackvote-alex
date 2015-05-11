class Hackday < ActiveRecord::Base
  has_many :projects
  validates :name, :presence => true, :length => { :maximum => 50 }

  def close_for_voting
    self.votable = false
  end
end
