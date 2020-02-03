# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

user = User.create(full_name: 'John Smith', email: 'admin@example.com',
                   password: 'password', password_confirmation: 'password')

place = Place.create(name: 'Family house', owner: user, code: 'fam')

tags = []
tags_counted = 10
tags_counted.times do |_t|
  tags << FactoryBot.create(:tag, owner: user, name: Faker::FunnyName.unique.name)
end

spots = []
['Bedroom', 'Warehouse', 'Attic', 'Garage', 'Cellar'].each do |name|
  spots << Spot.create(name: name, place: place, owner: user, code: name[0..2])
end

spots_counted = spots.size
boxes_counted = spots_counted * 5

cluster_boxes = []
boxes_counted.times do |_t|
  box = FactoryBot.create(:box, owner: user, spot: spots[rand(0..spots_counted - 1)])
  cluster_boxes << box if box.cluster?
end
cluster_boxes_counted = cluster_boxes.size

items_counted = spots_counted * 20

items = []
items_counted.times do |_t|
  items << Item.create(
    owner: user,
    tag_ids: [tags[rand(0..tags_counted - 1)].id, tags[rand(0..tags_counted - 1)].id].uniq,
    box: cluster_boxes[rand(0..cluster_boxes_counted - 1)],
    summary: Faker::Lorem.unique.sentence
  )
end
