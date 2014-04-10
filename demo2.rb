# Gems

require 'faker'
require 'mongo'
require 'json'

# Prepartions
include Mongo
include Faker
I18n.enforce_available_locales = false

# Start accessing the MongoDb server (remember to run it!)

mc = MongoClient.new

# Access the database called "people"
db = mc.db("contacts")

# And a collection called "contact_info" (collection is like a table in SQL)
col = db["contact_info"]

100.times do
	|i|
	contact = {}
	contact[:name] = Faker::Name.name
	contact[:email] = Faker::Internet.email
	col.insert(contact)
end

100.times do 
	contact = {}
	contact[:name] = "Faker::Name.name"
	contact[:email] = Faker::Internet.email
	contact[:home_address] = { 	city: Address.city, 
															street_address: Address.street_address,
															country: Address.country
														}
	contact[:office_address] = { 	city: Address.city, 
															street_address: Address.street_address,
															country: Address.country
														}
	col.insert(contact)
end


