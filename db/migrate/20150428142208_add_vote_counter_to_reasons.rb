class AddVoteCounterToReasons < ActiveRecord::Migration
  def change
    add_column :reasons, :votes_positive, :integer, :default => 0
    add_column :reasons, :votes_negative, :integer, :default => 0
    add_index :reasons, :votes_positive
    add_index :reasons, :votes_negative

    # Reason.all.each { |r| Reason.update_counters(r, votes_positive: r.votes_for.size) }
    Reason.all.each { |r| r.update_attributes(:votes_positive => r.votes_for.size) }

  end
end
