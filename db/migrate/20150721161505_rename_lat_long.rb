class RenameLatLong < ActiveRecord::Migration
  def change

  	rename_column :farms, :latitude, :new_longitude
  	rename_column :farms, :longitude, :new_latitude
  	rename_column :farms, :new_longitude, :longitude
  	rename_column :farms, :new_latitude, :latitude
  end
end
