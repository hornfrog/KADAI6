class Adduser2 < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :schedule_memo, :text
    change_column :users, :all_day, :boolean
  end
end
