class AddPrivateToSubTable < ActiveRecord::Migration
  def change
    add_column :subs, :private, :boolean
  end
end
