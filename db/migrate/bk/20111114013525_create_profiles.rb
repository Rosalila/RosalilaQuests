class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :users
      t.string :real_name
      t.string :nick
      t.string :picture

      t.timestamps
    end
    add_index :profiles, :users_id
  end
end
