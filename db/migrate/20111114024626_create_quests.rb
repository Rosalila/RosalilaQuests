class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.integer :creator_id
      t.integer :speciality_id
      t.integer :level
      t.string :name
      t.text :description
      t.integer :experience
      t.text :kelo_description
      t.integer :kelo_experience

      t.timestamps
    end
  end
end
