# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sauces = Sauce.create([{
                       name: 'Donec ultricies odio quis vehicula',
                       summary: 'Integer nibh lorem, cursus quis consectetur congue, pretium at enim. Vestibulum interdum arcu vel sapien consectetur, et rhoncus felis gravida. Pellentesque suscipit vehicula tortor. Proin eget varius massa, at faucibus tellus. Aenean lobortis libero vitae diam eleifend, vestibulum molestie nisl ullamcorper. Nam sit amet consequat odio. Quisque eu urna tincidunt, molestie justo a, tempor odio. Sed mattis ex venenatis, cursus sem sit amet, hendrerit lorem. Donec enim lorem, elementum vitae consectetur quis, varius ac magna. Vivamus faucibus consectetur faucibus. Maecenas venenatis dui sit amet congue dignissim. Phasellus nibh elit, ultricies id hendrerit sit amet, scelerisque sit amet augue. Nam pulvinar posuere finibus. Sed rhoncus vitae enim at efficitur. Pellentesque neque eros, feugiat vel quam eget, tincidunt tempor leo. Integer quis neque sem.',
                       heat: 0,
                       flavor: 5,
                       rating: 2,
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
                     },
                      {
                        name: 'Aliquam vel sapien',
                        summary: 'Vestibulum enim turpis, posuere non sagittis in, sodales vel nibh. Curabitur euismod, nibh a fringilla tincidunt, elit velit facilisis ligula, quis fermentum tortor neque vitae eros. Nullam molestie pellentesque urna, ut lobortis sem pretium eget. Vivamus at dolor lobortis, fringilla nibh ac, ullamcorper odio. Cras non sem et tortor tempus sagittis. Nunc ut libero scelerisque, sodales dolor nec, dignissim orci. Etiam id aliquam ligula, et laoreet ex. Praesent porttitor metus non lacinia blandit. Ut eu sapien tincidunt, accumsan magna dapibus, congue velit. Phasellus porttitor nulla enim, non fermentum tortor lobortis nec.',
                        heat: 2,
                        flavor: 3,
                        rating: 4,
                        comments: Comment.create(
                          [
                            {
                              commenter: 'Dude',
                              body: 'So good'
                            }
                          ]
                        )
                      },
                      {
                        name: 'Nunc lacus sem, lacinia rutrum faucibus',
                        summary: 'Vestibulum imperdiet elit felis, non mollis orci dignissim eget. Nullam euismod augue.',
                        heat: 5,
                        flavor: 1,
                        rating: 3
                      }])

sauces.each do | sauce |
  sauce.image.attach(
    io: File.open("#{Rails.root}/app/assets/images/placeholder_bottle.svg"),
    filename: 'file.jpg',
    content_type: 'image/svg+xml'
  )
end
