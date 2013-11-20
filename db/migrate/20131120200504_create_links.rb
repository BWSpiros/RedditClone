class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.integer :poster_id
      t.string :title
      t.text :description
      t.integer :sub_id
      t.integer :score

      t.timestamps
    end
    add_index :links, :poster_id
  end
end
