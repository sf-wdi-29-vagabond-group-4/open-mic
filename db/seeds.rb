# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "./app/models/user"
require "./app/models/venue"
require "faker"


Venue.destroy_all
User.destroy_all
10.times do
  v = Venue.new
  v.name = Faker::Company.name
  v.street_one = Faker::Address.street_address
  v.city = "San Francisco"
  v.state = "CA"
  v.zipcode = Faker::Address.zip
  v.phone_number = "415-555-1212"
  v.email = Faker::Internet.free_email
  v.description = Faker::Lorem.paragraph(4)
  v.profile_pic = Faker::Placeholdit.image
  v.save
end

10.times do
  v = Venue.new
  v.name = Faker::Company.name
  v.street_one = Faker::Address.street_address
  v.city = "Chicago"
  v.state = "IL"
  v.zipcode = Faker::Address.zip
  v.phone_number = "312-555-1212"
  v.email = Faker::Internet.free_email
  v.description = Faker::Lorem.paragraph(4)
  v.profile_pic = Faker::Placeholdit.image
  v.save
end

10.times do
  u = User.new
  u.first_name = Faker::Name.first_name
  u.last_name = Faker::Name.last_name
  u.email = Faker::Internet.free_email
  u.password = "12345"
  u.description = Faker::Lorem.paragraph(4)
  u.current_city = Faker::Address.city
  u.age = Faker::Number.between(13, 100)
  u.profile_pic = Faker::Placeholdit.image
  u.admin = false
  u.save
end