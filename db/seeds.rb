# require 'csv'

# # reads the entire CSV file and stores it as a variable marketnamed 'markets'
# markets = CSV.read('markets.csv', headers:true)

# # reads CSV file line by line
# CSV.foreach('markets.csv') do |row|
#   puts row.inspect
# end

require 'fast_seeder'

FastSeeder.seed_csv!(Market, "assets/markets.csv", :marketname, :website, :street, :city, :county, :state, :zip, :date, :time, :latitude, :longitude)

  # create_table "farms", force: :cascade do |t|
  #   t.string   "name"
  #   t.string   "address"
  #   t.text     "description"
  #   t.string   "phone"
  #   t.string   "website"
  #   t.integer  "user_id"
  #   t.datetime "created_at",                       null: false
  #   t.datetime "updated_at",                       null: false
  #   t.float    "latitude"
  #   t.float    "longitude"
  #   t.integer  "total_average_rating", default: 0
  #   t.text     "schedule"
  #   t.text     "products"

