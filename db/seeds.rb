# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Image.delete_all

100.times do |i|
  Image.create({ title: "Test Title #{i}", image_type: 0 })
  Image.create({ title: "Test Title #{i}", image_type: 1 })
  Image.create({ title: "Test Title #{i}", image_type: 2 })
  Image.create({ title: "Test Title #{i}", image_type: 3 })
end

