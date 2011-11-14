class CreateQuestMasters < ActiveRecord::Migration
  def change
    create_table :quest_masters do |t|
      t.integer :profile_id
      t.integer :speciality_id
      t.integer :level

      t.timestamps
    end
  end
end
