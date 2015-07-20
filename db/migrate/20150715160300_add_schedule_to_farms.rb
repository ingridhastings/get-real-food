class AddScheduleToFarms < ActiveRecord::Migration
  def change
    add_column :farms, :schedule, :text
  end
end
