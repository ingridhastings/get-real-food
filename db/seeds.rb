require 'csv'

CSV.foreach('markets.csv', headers: true) do |row|

Farm.create! row.to_hash
end



