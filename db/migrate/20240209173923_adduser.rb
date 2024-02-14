class Adduser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :start_day, :date
    add_column :users, :end_day, :date
    add_column :users, :all_day, :date
  end
end
