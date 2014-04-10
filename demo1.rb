require 'mongo'
require 'json'
include Mongo

# Start accessing the MongoDb server (remember to run it!)

mc = MongoClient.new
mc.database_names

# Access the database called "people"
db = mc.db("people")

# And a collection called "contact_info" (collection is like a table in SQL)
col = db.collection("contact_info")
col = db["contact_info"]

# Mongo stores data natively in JSON!
product = %[
  { "name": "MongoDB",
  "type": "database",
  "count": 1, 
  "info": 
  	{ "x" : 1, 
  		"y" : 2}
	}
]

product = JSON.parse(product)

# Notice we didn't define a schema!!!
doc = col.insert(product)
db.collection_names

# Now lets add multiple documents.
100.times { |i| col.insert("i" => i)}

# Wait, that document has a different schema!

