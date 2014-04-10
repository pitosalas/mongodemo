require 'mongo'
require 'json'
require 'csv'
require 'pry'

include Mongo

mc = MongoClient.new

# Access the database called "movies"
db = mc.db("movies")

# And a collection called "contact_info" (collection is like a table in SQL)
col = db.collection("movie_info")

# Read in movie database
CSV.foreach("data/u.item", col_sep: "|", headers: :first_row, encoding: 'windows-1251:utf-8') do |row|
	doc = row.to_hash
	col.insert(doc)
end
