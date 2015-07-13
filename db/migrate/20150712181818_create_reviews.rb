class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :farm_id
      t.integer :user_id
      t.text :content

      t.timestamps null: false
    end
  end
end
