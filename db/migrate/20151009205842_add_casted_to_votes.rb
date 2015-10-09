class AddCastedToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :casted, :boolean, default: false
  end
end
