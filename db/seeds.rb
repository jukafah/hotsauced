# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sauces = Sauce.create!([{
                       name: 'Mr Fuzz’s Nuclear Nectar - Nero BBQ',
                       description: "Extracted from the depths of the earth's core,
                       Mr. Fuzz's Nuclear nectar is sure to enflame the senses.
                       Fusing an irresistible hybrid of pleasure and pain, the nectar ignites the tongue,
                       the flames engulf the brain and, for the moment, nothing else matters..
                       in the midst of an endorphin flood and the elevated sensory experience that it fosters,
                       the subject can now mediate on the burn fully embracing the moment while becoming the
                       one with his/her environment. This isn't just a condiment; it's a way of life.

                       This is Twin Cities style BBQ sauce; despite the continued prominence of the bland Protestant palate,
                       we've got a melting pot coming to a beautiful boil here in the Twin Cities and things are only getting HOTTER.
                       Whether you're smoking brisket or spare ribs, slow-cooking jerk chicken, or spinnin'
                       shwarma or el pastor over the spit, this sauce is sure to breathe some fire and fun into your
                       outside get-together with family and friends! Take the meat out altogether and use it to
                       deglaze a veggie stir fry or light up a veggie patty sandwhich. Just remember: it's the moment that counts,
                       so make it a HOT one.",
                       pepper: 'Habanero',
                       ingredients: 'vinegar brine (vinegar, water), select habaneros, onions, tomate puree/paste, brown sugar,
                       honey, pineapple juice, bourbon whiskey, worcestershire sauce, carrots, garlic, spices, salt,
                       fresh-squeezed lime juice, canola oil, xanathan gum.',
                       brand: 'Fuzzology, Inc',
                       origin: 'Minneapolis, Minnesota'
}])

# sauces.each do | sauce |
#   sauce.image.attach(
#     io: File.open("#{Rails.root}/app/assets/images/placeholder_bottle.svg"),
#     filename: 'file.jpg',
#     content_type: 'image/svg+xml'
#   )
# end
