class AddUniqueUsermeetups < ActiveRecord::Migration
  def change
    add_index :usermeetups, [:user_id, :meetup_id], unique: true
  end
end
