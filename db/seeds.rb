# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# image = File.open("#{Rails.root}/app/assets/images/hotsauce_stock.jpg")

sauce = Sauce.create(
  name: 'Donec ultricies odio quis vehicula',
  summary: 'Integer nibh lorem, cursus quis consectetur congue, pretium at enim. Vestibulum interdum arcu vel sapien consectetur, et rhoncus felis gravida. Pellentesque suscipit vehicula tortor. Proin eget varius massa, at faucibus tellus. Aenean lobortis libero vitae diam eleifend, vestibulum molestie nisl ullamcorper. Nam sit amet consequat odio. Quisque eu urna tincidunt, molestie justo a, tempor odio. Sed mattis ex venenatis, cursus sem sit amet, hendrerit lorem. Donec enim lorem, elementum vitae consectetur quis, varius ac magna. Vivamus faucibus consectetur faucibus. Maecenas venenatis dui sit amet congue dignissim. Phasellus nibh elit, ultricies id hendrerit sit amet, scelerisque sit amet augue. Nam pulvinar posuere finibus. Sed rhoncus vitae enim at efficitur. Pellentesque neque eros, feugiat vel quam eget, tincidunt tempor leo. Integer quis neque sem.',
  heat: 0,
  flavor: 5,
  rating: 0,
  comments: Comment.create(
    [
      {
        commenter: 'John',
        body: 'cursus quis consectetur congue'
      },
      {
        commenter: 'Bill',
        body: 'Vestibulum molestie tempus mauris tincidunt eleifend'
      },
      {
        commenter: 'SuperguyXX',
        body: 'Nam vitae maximus sem.'
      }
    ]
  )
)

sauce.image.attach(
  io: File.open("#{Rails.root}/app/assets/images/hotsauce_stock.jpg"),
  filename: 'file.jpg',
  content_type: 'image/jpg'
)

