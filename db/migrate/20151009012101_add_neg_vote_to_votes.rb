class AddNegVoteToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :neg_vote, :boolean, default: false
  end
end
