class AddTotalAverageRatingToFarms < ActiveRecord::Migration
  def change
    add_column :farms, :total_average_rating, :integer, default: 0
  end
end
