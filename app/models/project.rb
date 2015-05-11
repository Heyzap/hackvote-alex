class Project < ActiveRecord::Base
  belongs_to :hackday
  validates :hackday_id, :presence => true
  validates :name, :presence => true, :length => { :maximum => 50 }
  validates :creators, :presence => true, :length => { :maximum => 50 }

  def vote
    self.votes += 1
  end
end
