# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Admin Account
User.create!( :email => "admin@estore.com",
              :password => "google555",
              :password_confirmation => "google555")
#Normal User
User.create!( :email => "test@skypig.com",
              :password => "tester1",
              :password_confirmation => "tester1")