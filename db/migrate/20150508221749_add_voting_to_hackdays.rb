class AddVotingToHackdays < ActiveRecord::Migration
  def change
    add_column :hackdays, :votable, :boolean, :default => true
  end
end
