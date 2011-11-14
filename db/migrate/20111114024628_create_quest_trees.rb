class CreateQuestTrees < ActiveRecord::Migration
  def change
    create_table :quest_trees do |t|
      t.integer :dependant_id
      t.integer :dependancy

      t.timestamps
    end
  end
end
