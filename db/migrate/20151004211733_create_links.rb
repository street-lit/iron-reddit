class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url, null: false
      t.integer :num_votes, default: 0
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
