# require 'csv'

# CSV.foreach('markets.csv', headers: true) do |row|

# Farm.create! row.to_hash
# end



require 'json'

json = JSON.parse(File.read("./db/seed.json"))

Farm.create! json