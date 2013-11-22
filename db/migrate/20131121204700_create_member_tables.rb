class CreateMemberTables < ActiveRecord::Migration
  def change
    create_table :member_tables do |t|
      t.integer :user_id
      t.integer :sub_id

      t.timestamps
    end
  end
end
