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



[{
                :name => "The Independent",
          :street_one => "628",
          :street_two => "Divisadero Street",
                :city => "San Francisco",
               :state => "California",
             :zipcode => 94117,
        :phone_number => "a",
               :email => "http://www.theindependentsf.com/",
         :description => "a",
         :profile_pic => "https://lh6.googleusercontent.com/-49HZU5Ief7U/UTb4I83HsgI/AAAAAAAAB4Q/GyOpFhw3PTQ6RSDbxcudJSSoVbBLO64TA/w600-h400-k/",
          :created_at => Fri, 24 Jun 2016 05:36:22 UTC +00:00,
          :updated_at => Fri, 24 Jun 2016 05:36:22 UTC +00:00,
            :latitude => 37.7755489,
           :longitude => -122.4376564,
        :full_address => "628 Divisadero St, San Francisco, CA 94117, USA",
            :admin_id => 23
    },
{
                :name => "Madrone Art Bar",
          :street_one => "500",
          :street_two => "Divisadero Street",
                :city => "San Francisco",
               :state => "California",
             :zipcode => 94117,
        :phone_number => "123-45",
               :email => "http://www.madroneartbar.com",
         :description => "a",
         :profile_pic => "https://lh5.googleusercontent.com/-3rUJEdY0uEs/VxQuKVFcVeI/AAAAAAAAutU/RgQnXroEGK0fmyWRR2DhM2nmTSWcVuUJg/w600-h400-k/",
          :created_at => Fri, 24 Jun 2016 05:37:17 UTC +00:00,
          :updated_at => Fri, 24 Jun 2016 05:37:17 UTC +00:00,
            :latitude => 37.7742401,
           :longitude => -122.4373705,
        :full_address => "500 Divisadero St, San Francisco, CA 94117, USA",
            :admin_id => 23
    },
{
                :name => "The Chapel",
          :street_one => "777",
          :street_two => "Valencia Street",
                :city => "San Francisco",
               :state => "California",
             :zipcode => 94110,
        :phone_number => "123",
               :email => "http://www.thechapelsf.com/",
         :description => "a",
         :profile_pic => "https://lh6.googleusercontent.com/-J4o3XoZ20ys/VV-yXJA8BJI/AAAAAAAAAA8/DN_6HZspUU0y1hzhsw5GFempPzWX5Bk2g/w600-h400-k/",
          :created_at => Fri, 24 Jun 2016 05:39:02 UTC +00:00,
          :updated_at => Fri, 24 Jun 2016 05:39:02 UTC +00:00,
            :latitude => 37.760565,
           :longitude => -122.421188,
        :full_address => "777 Valencia St, San Francisco, CA 94110, USA",
            :admin_id => 23
    },
      {
                :name => "The Fillmore",
          :street_one => "1805",
          :street_two => "Geary Boulevard",
                :city => "San Francisco",
               :state => "California",
             :zipcode => 94115,
        :phone_number => "123",
               :email => "http://www.livenation.com/venues/14270/the-fillmore",
         :description => "a",
         :profile_pic => "https://lh3.googleusercontent.com/-LxPmblyjiTg/VvAvhpP-bYI/AAAAAAAAHkU/v-J8Oa-d1Yg9OmKkXkDB89nsLMW4EFKsQ/w600-h400-k/",
          :created_at => Fri, 24 Jun 2016 05:39:31 UTC +00:00,
          :updated_at => Fri, 24 Jun 2016 05:39:31 UTC +00:00,
            :latitude => 37.7840042,
           :longitude => -122.4331332,
        :full_address => "1805 Geary Blvd, San Francisco, CA 94115, USA",
            :admin_id => 23
    },
{
                :name => "Audium",
          :street_one => "1616",
          :street_two => "Bush Street",
                :city => "San Francisco",
               :state => "California",
             :zipcode => 94109,
        :phone_number => "123",
               :email => "http://www.audium.org/",
         :description => "a",
         :profile_pic => "https://lh6.googleusercontent.com/-x6zXJG5pdH0/UbEUlrF2ifI/AAAAAAAATuw/MNB-z4FGKJk_g-P98WtQ8WCk1QjLu6Ksg/w600-h400-k/",
          :created_at => Fri, 24 Jun 2016 05:39:58 UTC +00:00,
          :updated_at => Fri, 24 Jun 2016 05:39:58 UTC +00:00,
            :latitude => 37.7884168,
           :longitude => -122.424021,
        :full_address => "1616 Bush St, San Francisco, CA 94109, USA",
            :admin_id => 23
    },
{
                :name => "Lincoln Hall",
          :street_one => "2424",
          :street_two => "North Lincoln Avenue",
                :city => "Chicago",
               :state => "Illinois",
             :zipcode => 60614,
        :phone_number => "123",
               :email => "http://www.lincolnhallchicago.com/",
         :description => "a",
         :profile_pic => "https://lh6.googleusercontent.com/-KRklVZrtjDE/Vl5f1tKjrMI/AAAAAAAAD7c/54ZErzEQ-M8lbAWwKcMmtRLmlfvsx3-RQ/w600-h400-k/",
          :created_at => Fri, 24 Jun 2016 06:34:08 UTC +00:00,
          :updated_at => Fri, 24 Jun 2016 06:34:08 UTC +00:00,
            :latitude => 41.92592,
           :longitude => -87.6498511,
        :full_address => "2424 N Lincoln Ave, Chicago, IL 60614, USA",
            :admin_id => 23
    },
    {
                :name => "The Empty Bottle",
          :street_one => "1035",
          :street_two => "North Western Avenue",
                :city => "Chicago",
               :state => "Illinois",
             :zipcode => 60622,
        :phone_number => "123",
               :email => "http://www.emptybottle.com/",
         :description => "a",
         :profile_pic => "https://lh6.googleusercontent.com/-JehQARm_LjY/VIEC5GvxqtI/AAAAAAAAAA0/0JDcGTVSDhkUqPnfiAOPIOJjwJfMhtpXw/w600-h400-k/",
          :created_at => Fri, 24 Jun 2016 06:35:00 UTC +00:00,
          :updated_at => Fri, 24 Jun 2016 06:35:00 UTC +00:00,
            :latitude => 41.9004625,
           :longitude => -87.6866398,
        :full_address => "1035 N Western Ave, Chicago, IL 60622, USA",
            :admin_id => 23
    },
{
                :name => "Metro",
          :street_one => "3730",
          :street_two => "North Clark Street",
                :city => "Chicago",
               :state => "Illinois",
             :zipcode => 60613,
        :phone_number => "123",
               :email => "http://www.metrochicago.com/",
         :description => "a",
         :profile_pic => "https://lh5.googleusercontent.com/-_kw4KlF3jUs/U5t1CcfBoEI/AAAAAAAAB4Y/7Ytk0aM_teU08U2BBP3WGaaGxj5Z86HsQ/w600-h400-k/",
          :created_at => Fri, 24 Jun 2016 06:35:30 UTC +00:00,
          :updated_at => Fri, 24 Jun 2016 06:35:30 UTC +00:00,
            :latitude => 41.9498198,
           :longitude => -87.65888,
        :full_address => "3730 N Clark St, Chicago, IL 60613, USA",
            :admin_id => 23
    },
{
                :name => "Schubas Tavern",
          :street_one => "3159",
          :street_two => "North Southport Avenue",
                :city => "Chicago",
               :state => "Illinois",
             :zipcode => 60657,
        :phone_number => "123",
               :email => "http://www.schubas.com/",
         :description => "a",
         :profile_pic => "https://lh3.googleusercontent.com/-ZBk_s4YQFS8/Uc8n9qJ4pxI/AAAAAAAACnM/0p9HKdfZG6AS2oDbJdJg_0dNZl3liW4VQ/w600-h400-k/",
          :created_at => Fri, 24 Jun 2016 06:36:10 UTC +00:00,
          :updated_at => Fri, 24 Jun 2016 06:36:10 UTC +00:00,
            :latitude => 41.939652,
           :longitude => -87.6634602,
        :full_address => "3159 N Southport Ave, Chicago, IL 60657, USA",
            :admin_id => 23
    },
{
                :name => "Township",
          :street_one => "2200",
          :street_two => "North California Avenue",
                :city => "Chicago",
               :state => "Illinois",
             :zipcode => 60647,
        :phone_number => "123",
               :email => "http://www.townshipchicago.com/",
         :description => "a",
         :profile_pic => "https://lh4.googleusercontent.com/-9Fa_kojhAoQ/V2YeYSc24iI/AAAAAAAAAM0/kANom0F_4N0d8-t5HcbwdBCp1IUJMqSTACLIB/w600-h400-k/",
          :created_at => Fri, 24 Jun 2016 06:36:38 UTC +00:00,
          :updated_at => Fri, 24 Jun 2016 06:36:38 UTC +00:00,
            :latitude => 41.9218719,
           :longitude => -87.6976005,
        :full_address => "2200 N California Ave, Chicago, IL 60647, USA",
            :admin_id => 23
    },
{
                :name => "Slim's",
          :street_one => "333",
          :street_two => "11th Street",
                :city => "San Francisco",
               :state => "California",
             :zipcode => 94103,
        :phone_number => "1234",
               :email => "http://www.slimspresents.com/",
         :description => "a",
         :profile_pic => "https://lh4.googleusercontent.com/-B85SCWb0QJk/US7prT5oVnI/AAAAAAAAA4M/YK8SS-nEKmMBrrtSx3PjiKfYAkUg8XXNw/w600-h400-k/",
          :created_at => Fri, 24 Jun 2016 07:07:05 UTC +00:00,
          :updated_at => Fri, 24 Jun 2016 09:21:27 UTC +00:00,
            :latitude => 37.7715143,
           :longitude => -122.4133026,
        :full_address => "333 11th St, San Francisco, CA 94103, USA",
            :admin_id => 23
    }
]