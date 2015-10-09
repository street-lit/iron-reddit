# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: "mike", email: "mike@example.com", password: "password")
User.create(name: "kindra", email: "kindra@example.com", password: "password")
User.create(name: "ken", email: "ken@example.com", password: "password")

Link.create(url: "www.yahoo.com", num_votes: 0, user_id: 1)
Link.create(url: "maps.google.com", num_votes: 0, user_id: 1)
Link.create(url: "www.weather.com", num_votes: 0, user_id: 1)
Link.create(url: "www.gmail.com", num_votes: 0, user_id: 2)
Link.create(url: "austin.craigslist.com", num_votes: 0, user_id: 2)
Link.create(url: "www.google.com", num_votes: 0, user_id: 2)
Link.create(url: "www.facebook.com", num_votes: 0, user_id: 3)
Link.create(url: "www.altavista.com", num_votes: 0, user_id: 3)
Link.create(url: "www.angelfire.com", num_votes: 0, user_id: 3)
