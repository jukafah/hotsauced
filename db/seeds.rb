# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

sauces = Sauce.create!([{
                         name: 'Mr Fuzz’s Nuclear Nectar - Nero BBQ',
                         description: "Extracted from the depths of the earth's core, Mr. Fuzz's Nuclear nectar is sure to enflame the senses. Fusing an irresistible hybrid of pleasure and pain, the nectar ignites the tongue, the flames engulf the brain and, for the moment, nothing else matters.. in the midst of an endorphin flood and the elevated sensory experience that it fosters, the subject can now mediate on the burn fully embracing the moment while becoming the one with his/her environment. This isn't just a condiment; it's a way of life.\n
                         This is Twin Cities style BBQ sauce; despite the continued prominence of the bland Protestant palate, we've got a melting pot coming to a beautiful boil here in the Twin Cities and things are only getting HOTTER. Whether you're smoking brisket or spare ribs, slow-cooking jerk chicken, or spinnin' shwarma or el pastor over the spit, this sauce is sure to breathe some fire and fun into your outside get-together with family and friends! Take the meat out altogether and use it to deglaze a veggie stir fry or light up a veggie patty sandwhich. Just remember: it's the moment that counts, so make it a HOT one.",
                         pepper: 'Habanero',
                         ingredients: 'vinegar brine (vinegar, water), select habaneros, onions, tomate puree/paste, brown sugar, honey, pineapple juice, bourbon whiskey, worcestershire sauce, carrots, garlic, spices, salt, fresh-squeezed lime juice, canola oil, xanathan gum.',
                         brand: 'Fuzzology, Inc',
                         origin: 'Minneapolis, Minnesota',
                         reviews: Review.create([
                                                   {
                                                     user: 'HotSauceFanatic101',
                                                     headline: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                                                     body: 'Sed tempor ultrices nunc, ac porttitor purus malesuada vitae. Integer elit sem, accumsan eget velit a, viverra rhoncus sapien. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse porta tempus lectus. Integer vitae dignissim eros, at faucibus nibh. Nulla facilisis semper orci, sit amet varius turpis facilisis nec. Nulla facilisi. Praesent aliquam neque ut orci sollicitudin, eu vestibulum dui consectetur.',
                                                     rating: 5
                                                   },
                                                   {
                                                     user: 'HotSauceHerald',
                                                     headline: 'In pharetra quam nec elit rhoncus laoreet. Sed.',
                                                     body: "Vivamus at justo consectetur sem ullamcorper porttitor non at ligula. Mauris euismod nibh eget sapien dictum fermentum. Curabitur eu lectus est. Donec pretium eros at elementum euismod. Suspendisse sed nisi eget ipsum lobortis finibus quis ut nulla. Donec euismod dolor vel nisi elementum, a imperdiet nulla varius. Nullam suscipit sem sit amet mi auctor, non aliquam mauris suscipit. Sed venenatis placerat tortor, nec sodales mi rhoncus quis. Vivamus ac aliquam libero. In lacinia lacus sit amet arcu hendrerit, et semper enim sodales.\n
                                                     Donec viverra elit tortor, porttitor tempor nisl volutpat in. Ut facilisis elementum augue, id egestas ipsum malesuada quis. Fusce elementum elit vel cursus vestibulum. Morbi ut justo condimentum, luctus diam convallis, porttitor orci. Donec fermentum dolor id leo maximus tempor. Phasellus finibus varius fermentum. Aliquam erat volutpat. Nullam cursus sed nisi eu ultricies. Suspendisse auctor sapien quis lorem luctus gravida. Aenean turpis leo, ornare quis euismod eget, pulvinar sit amet tortor. Sed fermentum est pulvinar tincidunt euismod. Donec porta nec nunc id elementum. Curabitur dolor nisl, varius quis congue in, accumsan vel velit.",
                                                     rating: 5
                                                   },
                                                   {
                                                    user: 'SauceAdvocate',
                                                    headline: 'Aliquam lorem erat, ultricies vel.',
                                                    body: 'Duis dui leo, sagittis id nisl id, malesuada condimentum sem. Praesent in lectus elit. Pellentesque a egestas dolor. In hac habitasse platea dictumst. Nunc fringilla lectus eu cursus hendrerit. Proin a augue et mi rutrum fermentum. Maecenas a erat pharetra, posuere purus in, fringilla nunc. Phasellus bibendum dignissim purus quis sollicitudin. Duis sodales porttitor magna, nec eleifend mauris imperdiet vel. Aenean scelerisque condimentum turpis viverra pharetra.',
                                                    rating: 4
                                                  }
                                                 ])
                       }])

# sauces.each do | sauce |
#   sauce.image.attach(
#     io: File.open("#{Rails.root}/app/assets/images/placeholder_bottle.svg"),
#     filename: 'file.jpg',
#     content_type: 'image/svg+xml'
#   )
# end
