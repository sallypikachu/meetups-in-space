class CreateUsermeetups < ActiveRecord::Migration
  def change
    create_table :usermeetups do |table|
      table.belongs_to :user, index: true, null: false
      table.belongs_to :meetup, index: true, null: false

      table.timestamps null: false
    end
  end
end
