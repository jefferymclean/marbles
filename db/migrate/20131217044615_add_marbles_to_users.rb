class AddMarblesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :marbles, :integer, default: 1
  end
end
