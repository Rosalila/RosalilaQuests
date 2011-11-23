class CreateCompletedQuests < ActiveRecord::Migration
  def change
    create_table :completed_quests do |t|
      t.integer :quest_id
      t.integer :reviewer_id
      t.integer :profile_id
      t.integer :experience_won
      t.integer :kelo_won
      t.text :comment

      t.timestamps
    end
  end
end
