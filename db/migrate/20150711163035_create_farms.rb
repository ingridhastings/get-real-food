class CreateFarms < ActiveRecord::Migration
  def change
    create_table :farms do |t|
      t.string :name
      t.string :address
      t.string :website
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
