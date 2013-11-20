class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :poster_id
      t.integer :parent_id
      t.integer :link_id

      t.timestamps
    end
  end
end
