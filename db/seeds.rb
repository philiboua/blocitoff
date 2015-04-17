# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

#create Users

10.times do 
  a = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "hellorails"
    )
  a.skip_confirmation!
  a.save
end

user = User.all

100.times do
  b = Item.create(
    user: user.sample,
    name: Faker::Lorem.sentence
    )
end

  puts "seed finished"
  puts "#{User.count} users created"
  puts "#{Item.count} items created" 

