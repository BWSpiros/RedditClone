class CreateModeratorTables < ActiveRecord::Migration
  def change
    create_table :moderator_tables do |t|
      t.integer :user_id
      t.integer :sub_id

      t.timestamps
    end
  end
end
