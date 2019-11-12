class AddSetScoresTables < ActiveRecord::Migration[5.1]
  def change
    create_table :set_scores do |t|
      t.integer :user_id
      t.integer :total_score, default: 0
      t.datetime :date

      t.timestamps
    end

    create_table :set_score_details do |t|
      t.integer :set_score_id
      t.integer :set_type, default: 0
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
