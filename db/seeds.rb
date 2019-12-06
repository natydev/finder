# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
place = Place.create(name: 'Family house')

tags = []
tags_counted = 10
tags_counted.times do |t|
  tags << Tag.create(name: Faker::FunnyName.unique.name)
end


spots = []
['Soffitta bassa', 'Soffitta alta', 'Garage', 'Cantina'].each do |name|
  spots << Spot.create(name: name, place: place)
end

spots_counted = spots.size
boxes_counted = spots_counted * 5

boxes = []
boxes_counted.times do |t|
  boxes << Box.create(
    spot: spots[rand(0..spots_counted-1)],
    summary: Faker::Lorem.unique.sentence,
    code: Faker::Lorem.unique.characters(number: 3).upcase,
    issued_on: Faker::Date.between(from: 5.years.ago, to: Date.today)
  )
end

items_counted = spots_counted * 20

items = []
items_counted.times do |t|
  items << Item.create(
    tag_ids: [tags[rand(0..tags_counted-1)].id, tags[rand(0..tags_counted-1)].id].uniq,
    box: boxes[rand(0..boxes_counted-1)],
    summary: Faker::Lorem.unique.sentence)
end