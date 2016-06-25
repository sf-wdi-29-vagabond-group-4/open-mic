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
User.destroy_all
User.create([{first_name: "Jasmine", last_name: "McFinley", email:"JFinley@gmail.com", password: "12345", current_city: "San Fransisco", 
  age: "21",profile_pic:"http://orig12.deviantart.net/dfc1/f/2011/060/b/c/female_stock_023_by_animegirlfever_stock-d3aobnz.jpg", description: "I am a music enthusiast"}])

User.create([
  {first_name: "Ben", 
    last_name: "Hulan", 
    email: "BHulan@GA.com", 
    password:"12345", 
    current_city: "San Fransisco", 
    age: "44", 
    profile_pic: "https://a3-images.myspacecdn.com/images03/33/82e6046482264aaab97137075a9a481b/300x300.jpg",
    description: "I love to play the guitar"}
    ])
  
User.create([
  {first_name: "Alex",
    last_name: "White",
    email: "Alex@GA.com",
    password: "12345",
    current_city: "San Fransisco",
    age: "32",
    profile_pic: "https://ga-core.s3.amazonaws.com/production/uploads/instructor/image/7143/thumb_AAEAAQAAAAAAAAYQAAAAJDQ5NDA0NjM3LTg1MzItNDkyMi1iMDMwLTNiMjJmYmE1Mjg1Yw.jpg",
    description: "I love to Skate and visit comedy venues!"}
  ])

User.create([
  {first_name: "Annabelle",
    last_name: "Thaddeus",
    email: "Annabelle@GA.com",
    password: "12345",
    current_city: "San Fransisco",
    age: "21",
    profile_pic: "http://www.annabellethaddeus.com/IMG_8045.JPG",
    description: "I love to visit all the venues!"

  }])

User.create([
  {first_name: "Brianna",
    last_name: "Veenstra",
    email: "Brianna@GA.com",
    password: "12345",
    current_city: "Chicago",
    age: "23",
    profile_pic: "http://e2ua.com/data/wallpapers/18/WDF_667595.jpg",
    description: "I love to listen to music and visit the venues!" 

  }])
  
  User.create([
    {first_name: "Ilias",
      last_name: "Tsangaris",
      email: "Ilias@GA.com",
      password: "12345",
      current_city: "San Fransisco",
      age: "32",
      profile_pic: "https://ga-core.s3.amazonaws.com/production/uploads/instructor/image/3770/thumb_ilias.jpg",
      description: "I love to play the guitar and check out bands at venues!"
    }])

  User.create([
    {first_name: "Metallica",
      last_name: "Metallica",
      email: "Metallica@gmail.com",
      password: "12345",
      current_city: "Chicago",
      age: "50",
      profile_pic: "http://www.billboard.com/files/styles/article_main_image/public/media/Metallica-1985-group-billboard-650.jpg",
      description: "We love the website and use it to list our venues!"

    }])

  User.create([
    {first_name: "311",
      last_name: "311",
      email: "311@gmail.com",
      password: "12345",
      current_city: "San Fransisco",
      age: "45",
      profile_pic: "http://allstonpudding.com/wp-content/uploads/2015/03/311-band.jpg",
      description: "We are checking out new type of groups around!"

      }])

Venue.destroy_all
# User.destroy_all
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


# 10.times do
#   u = User.new
#   u.first_name = Faker::Name.first_name
#   u.last_name = Faker::Name.last_name
#   u.email = Faker::Internet.free_email
#   u.password = "12345"
#   u.description = Faker::Lorem.paragraph(4)
#   u.current_city = Faker::Address.city
#   u.age = Faker::Number.between(13, 100)
#   u.profile_pic = Faker::Placeholdit.image
#   u.admin = false
#   u.save
# end