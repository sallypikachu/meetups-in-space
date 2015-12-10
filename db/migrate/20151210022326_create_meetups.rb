class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |table|
      table.string :title, null: false
      table.string :details, null: false
      table.string :tag, null: false

      table.timestamps null: false
    end
  end
end
