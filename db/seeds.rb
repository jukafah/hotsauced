# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sauce = Sauce.create(
    [
      {
        name: 'Test seed with comments',
        summary: 'Test seed with comments',
        heat: 2,
        flavor: 3,
        rating: 4,
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
      },
      {
        name: 'Mauris mauris massa, accumsan et',
        summary: 'Vestibulum molestie tempus mauris tincidunt eleifend. Aliquam dictum, quam vitae fermentum bibendum, enim arcu bibendum dolor, vitae luctus arcu nisi placerat ligula. Praesent euismod nibh nec odio egestas cursus. Curabitur ac augue et nisl laoreet eleifend et et odio. Nullam eu suscipit purus. Nunc ultrices bibendum metus ultricies laoreet. Curabitur elementum eu urna sed vulputate. Quisque convallis ligula ex, nec lacinia diam fermentum nec. Vestibulum aliquet non arcu fermentum pellentesque.',
        heat: 5,
        flavor: 2,
        rating: 5
      },
      {
        name: 'Fusce porttitor quam lorem, eget',
        summary: 'Donec fermentum magna quis sapien malesuada fringilla. Sed diam ligula, aliquet id tellus sit amet, vestibulum vestibulum est. Proin faucibus, mi vitae dapibus aliquet, tellus lorem laoreet metus, eu tempor enim justo non lacus. Sed odio quam, dignissim eu urna sit amet, porttitor viverra magna. Duis eu dictum magna. Aenean quis mi ex. Morbi consequat odio lorem, sit amet ultricies ligula dapibus vitae. Fusce felis diam, semper eu nulla eu, auctor egestas sem. Etiam auctor massa eu felis volutpat euismod. In feugiat sed quam sed gravida. Curabitur quam risus, tempus at sollicitudin a, suscipit quis nisl. In vehicula gravida leo ac eleifend. Integer volutpat enim nec bibendum vulputate. In bibendum diam eu condimentum porttitor. Pellentesque porttitor ornare malesuada.',
        heat: 4,
        flavor: 1,
        rating: 4
      },
      {
        name: 'Nam vehicula justo sed varius',
        summary: 'Nam vitae maximus sem. Phasellus aliquam at arcu in euismod. Vestibulum quis magna lacus. Aenean feugiat odio eget erat venenatis vestibulum. Fusce eget odio ac lectus egestas gravida. Ut in dolor euismod, malesuada nisl vitae, interdum risus. Duis finibus neque sed blandit facilisis. Ut venenatis diam enim, a convallis neque rutrum sed. Proin sit amet maximus eros, ut tristique metus. Maecenas vestibulum tellus vitae arcu suscipit consectetur. Proin pharetra nec enim quis commodo. Praesent vulputate dapibus libero.',
        heat: 3,
        flavor: 2,
        rating: 3,
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
        name: 'Phasellus odio felis, maximus nec',
        summary: 'Aliquam tincidunt hendrerit ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In finibus metus vitae lobortis ultrices. Mauris quis lectus nunc. Nam elementum, massa at ornare ullamcorper, lacus eros faucibus lacus, eu ultricies nisl nisi in nunc. Maecenas sit amet auctor libero, non imperdiet diam. Mauris viverra sodales erat et fringilla. Aenean dui mi, dignissim in elit quis, vestibulum laoreet massa. Donec orci tortor, pharetra cursus sapien at, consequat bibendum tortor. Donec a sodales augue. Sed auctor urna velit, vel aliquam augue sodales vitae. Duis ut auctor dolor. Duis varius mattis massa, ac bibendum lorem laoreet viverra. Interdum et malesuada fames ac ante ipsum primis in faucibus. Duis maximus malesuada massa.',
        heat: 2,
        flavor: 0,
        rating: 2
      },
      {
        name: 'Phasellus hendrerit placerat neque vel',
        summary: 'In sodales maximus diam vel finibus. Aliquam egestas tincidunt mollis. Phasellus varius quis massa nec finibus. In eu turpis est. Donec facilisis dui eu aliquam molestie. Morbi pharetra libero lorem, nec accumsan nibh cursus at. Fusce malesuada erat in tincidunt tincidunt. Duis ultrices, justo feugiat auctor interdum, augue quam lobortis magna, sit amet convallis nisi odio sit amet quam. Phasellus at est id leo pulvinar pretium sit amet ut dui. Praesent molestie nisi vel augue porttitor, nec facilisis erat scelerisque. Phasellus efficitur sem at neque venenatis, sit amet interdum nibh dignissim. Sed quis est eros.',
        heat: 2,
        flavor: 0,
        rating: 1
      },
      {
        name: 'Donec ultricies odio quis vehicula',
        summary: 'Integer nibh lorem, cursus quis consectetur congue, pretium at enim. Vestibulum interdum arcu vel sapien consectetur, et rhoncus felis gravida. Pellentesque suscipit vehicula tortor. Proin eget varius massa, at faucibus tellus. Aenean lobortis libero vitae diam eleifend, vestibulum molestie nisl ullamcorper. Nam sit amet consequat odio. Quisque eu urna tincidunt, molestie justo a, tempor odio. Sed mattis ex venenatis, cursus sem sit amet, hendrerit lorem. Donec enim lorem, elementum vitae consectetur quis, varius ac magna. Vivamus faucibus consectetur faucibus. Maecenas venenatis dui sit amet congue dignissim. Phasellus nibh elit, ultricies id hendrerit sit amet, scelerisque sit amet augue. Nam pulvinar posuere finibus. Sed rhoncus vitae enim at efficitur. Pellentesque neque eros, feugiat vel quam eget, tincidunt tempor leo. Integer quis neque sem.',
        heat: 0,
        flavor: 5,
        rating: 0
      },
      {
        name: 'Test seed with comments',
        summary: 'Test seed with comments',
        heat: 2,
        flavor: 3,
        rating: 4,
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
      },
      {
        name: 'Mauris mauris massa, accumsan et',
        summary: 'Vestibulum molestie tempus mauris tincidunt eleifend. Aliquam dictum, quam vitae fermentum bibendum, enim arcu bibendum dolor, vitae luctus arcu nisi placerat ligula. Praesent euismod nibh nec odio egestas cursus. Curabitur ac augue et nisl laoreet eleifend et et odio. Nullam eu suscipit purus. Nunc ultrices bibendum metus ultricies laoreet. Curabitur elementum eu urna sed vulputate. Quisque convallis ligula ex, nec lacinia diam fermentum nec. Vestibulum aliquet non arcu fermentum pellentesque.',
        heat: 5,
        flavor: 2,
        rating: 5
      },
      {
        name: 'Fusce porttitor quam lorem, eget',
        summary: 'Donec fermentum magna quis sapien malesuada fringilla. Sed diam ligula, aliquet id tellus sit amet, vestibulum vestibulum est. Proin faucibus, mi vitae dapibus aliquet, tellus lorem laoreet metus, eu tempor enim justo non lacus. Sed odio quam, dignissim eu urna sit amet, porttitor viverra magna. Duis eu dictum magna. Aenean quis mi ex. Morbi consequat odio lorem, sit amet ultricies ligula dapibus vitae. Fusce felis diam, semper eu nulla eu, auctor egestas sem. Etiam auctor massa eu felis volutpat euismod. In feugiat sed quam sed gravida. Curabitur quam risus, tempus at sollicitudin a, suscipit quis nisl. In vehicula gravida leo ac eleifend. Integer volutpat enim nec bibendum vulputate. In bibendum diam eu condimentum porttitor. Pellentesque porttitor ornare malesuada.',
        heat: 4,
        flavor: 1,
        rating: 4
      },
      {
        name: 'Nam vehicula justo sed varius',
        summary: 'Nam vitae maximus sem. Phasellus aliquam at arcu in euismod. Vestibulum quis magna lacus. Aenean feugiat odio eget erat venenatis vestibulum. Fusce eget odio ac lectus egestas gravida. Ut in dolor euismod, malesuada nisl vitae, interdum risus. Duis finibus neque sed blandit facilisis. Ut venenatis diam enim, a convallis neque rutrum sed. Proin sit amet maximus eros, ut tristique metus. Maecenas vestibulum tellus vitae arcu suscipit consectetur. Proin pharetra nec enim quis commodo. Praesent vulputate dapibus libero.',
        heat: 3,
        flavor: 2,
        rating: 3,
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
        name: 'Phasellus odio felis, maximus nec',
        summary: 'Aliquam tincidunt hendrerit ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In finibus metus vitae lobortis ultrices. Mauris quis lectus nunc. Nam elementum, massa at ornare ullamcorper, lacus eros faucibus lacus, eu ultricies nisl nisi in nunc. Maecenas sit amet auctor libero, non imperdiet diam. Mauris viverra sodales erat et fringilla. Aenean dui mi, dignissim in elit quis, vestibulum laoreet massa. Donec orci tortor, pharetra cursus sapien at, consequat bibendum tortor. Donec a sodales augue. Sed auctor urna velit, vel aliquam augue sodales vitae. Duis ut auctor dolor. Duis varius mattis massa, ac bibendum lorem laoreet viverra. Interdum et malesuada fames ac ante ipsum primis in faucibus. Duis maximus malesuada massa.',
        heat: 2,
        flavor: 0,
        rating: 2
      },
      {
        name: 'Phasellus hendrerit placerat neque vel',
        summary: 'In sodales maximus diam vel finibus. Aliquam egestas tincidunt mollis. Phasellus varius quis massa nec finibus. In eu turpis est. Donec facilisis dui eu aliquam molestie. Morbi pharetra libero lorem, nec accumsan nibh cursus at. Fusce malesuada erat in tincidunt tincidunt. Duis ultrices, justo feugiat auctor interdum, augue quam lobortis magna, sit amet convallis nisi odio sit amet quam. Phasellus at est id leo pulvinar pretium sit amet ut dui. Praesent molestie nisi vel augue porttitor, nec facilisis erat scelerisque. Phasellus efficitur sem at neque venenatis, sit amet interdum nibh dignissim. Sed quis est eros.',
        heat: 2,
        flavor: 0,
        rating: 1
      },
      {
        name: 'Donec ultricies odio quis vehicula',
        summary: 'Integer nibh lorem, cursus quis consectetur congue, pretium at enim. Vestibulum interdum arcu vel sapien consectetur, et rhoncus felis gravida. Pellentesque suscipit vehicula tortor. Proin eget varius massa, at faucibus tellus. Aenean lobortis libero vitae diam eleifend, vestibulum molestie nisl ullamcorper. Nam sit amet consequat odio. Quisque eu urna tincidunt, molestie justo a, tempor odio. Sed mattis ex venenatis, cursus sem sit amet, hendrerit lorem. Donec enim lorem, elementum vitae consectetur quis, varius ac magna. Vivamus faucibus consectetur faucibus. Maecenas venenatis dui sit amet congue dignissim. Phasellus nibh elit, ultricies id hendrerit sit amet, scelerisque sit amet augue. Nam pulvinar posuere finibus. Sed rhoncus vitae enim at efficitur. Pellentesque neque eros, feugiat vel quam eget, tincidunt tempor leo. Integer quis neque sem.',
        heat: 0,
        flavor: 5,
        rating: 0
      },
      {
        name: 'Test seed with comments',
        summary: 'Test seed with comments',
        heat: 2,
        flavor: 3,
        rating: 4,
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
      },
      {
        name: 'Mauris mauris massa, accumsan et',
        summary: 'Vestibulum molestie tempus mauris tincidunt eleifend. Aliquam dictum, quam vitae fermentum bibendum, enim arcu bibendum dolor, vitae luctus arcu nisi placerat ligula. Praesent euismod nibh nec odio egestas cursus. Curabitur ac augue et nisl laoreet eleifend et et odio. Nullam eu suscipit purus. Nunc ultrices bibendum metus ultricies laoreet. Curabitur elementum eu urna sed vulputate. Quisque convallis ligula ex, nec lacinia diam fermentum nec. Vestibulum aliquet non arcu fermentum pellentesque.',
        heat: 5,
        flavor: 2,
        rating: 5
      },
      {
        name: 'Fusce porttitor quam lorem, eget',
        summary: 'Donec fermentum magna quis sapien malesuada fringilla. Sed diam ligula, aliquet id tellus sit amet, vestibulum vestibulum est. Proin faucibus, mi vitae dapibus aliquet, tellus lorem laoreet metus, eu tempor enim justo non lacus. Sed odio quam, dignissim eu urna sit amet, porttitor viverra magna. Duis eu dictum magna. Aenean quis mi ex. Morbi consequat odio lorem, sit amet ultricies ligula dapibus vitae. Fusce felis diam, semper eu nulla eu, auctor egestas sem. Etiam auctor massa eu felis volutpat euismod. In feugiat sed quam sed gravida. Curabitur quam risus, tempus at sollicitudin a, suscipit quis nisl. In vehicula gravida leo ac eleifend. Integer volutpat enim nec bibendum vulputate. In bibendum diam eu condimentum porttitor. Pellentesque porttitor ornare malesuada.',
        heat: 4,
        flavor: 1,
        rating: 4
      },
      {
        name: 'Nam vehicula justo sed varius',
        summary: 'Nam vitae maximus sem. Phasellus aliquam at arcu in euismod. Vestibulum quis magna lacus. Aenean feugiat odio eget erat venenatis vestibulum. Fusce eget odio ac lectus egestas gravida. Ut in dolor euismod, malesuada nisl vitae, interdum risus. Duis finibus neque sed blandit facilisis. Ut venenatis diam enim, a convallis neque rutrum sed. Proin sit amet maximus eros, ut tristique metus. Maecenas vestibulum tellus vitae arcu suscipit consectetur. Proin pharetra nec enim quis commodo. Praesent vulputate dapibus libero.',
        heat: 3,
        flavor: 2,
        rating: 3,
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
        name: 'Phasellus odio felis, maximus nec',
        summary: 'Aliquam tincidunt hendrerit ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In finibus metus vitae lobortis ultrices. Mauris quis lectus nunc. Nam elementum, massa at ornare ullamcorper, lacus eros faucibus lacus, eu ultricies nisl nisi in nunc. Maecenas sit amet auctor libero, non imperdiet diam. Mauris viverra sodales erat et fringilla. Aenean dui mi, dignissim in elit quis, vestibulum laoreet massa. Donec orci tortor, pharetra cursus sapien at, consequat bibendum tortor. Donec a sodales augue. Sed auctor urna velit, vel aliquam augue sodales vitae. Duis ut auctor dolor. Duis varius mattis massa, ac bibendum lorem laoreet viverra. Interdum et malesuada fames ac ante ipsum primis in faucibus. Duis maximus malesuada massa.',
        heat: 2,
        flavor: 0,
        rating: 2
      },
      {
        name: 'Phasellus hendrerit placerat neque vel',
        summary: 'In sodales maximus diam vel finibus. Aliquam egestas tincidunt mollis. Phasellus varius quis massa nec finibus. In eu turpis est. Donec facilisis dui eu aliquam molestie. Morbi pharetra libero lorem, nec accumsan nibh cursus at. Fusce malesuada erat in tincidunt tincidunt. Duis ultrices, justo feugiat auctor interdum, augue quam lobortis magna, sit amet convallis nisi odio sit amet quam. Phasellus at est id leo pulvinar pretium sit amet ut dui. Praesent molestie nisi vel augue porttitor, nec facilisis erat scelerisque. Phasellus efficitur sem at neque venenatis, sit amet interdum nibh dignissim. Sed quis est eros.',
        heat: 2,
        flavor: 0,
        rating: 1
      },
      {
        name: 'Donec ultricies odio quis vehicula',
        summary: 'Integer nibh lorem, cursus quis consectetur congue, pretium at enim. Vestibulum interdum arcu vel sapien consectetur, et rhoncus felis gravida. Pellentesque suscipit vehicula tortor. Proin eget varius massa, at faucibus tellus. Aenean lobortis libero vitae diam eleifend, vestibulum molestie nisl ullamcorper. Nam sit amet consequat odio. Quisque eu urna tincidunt, molestie justo a, tempor odio. Sed mattis ex venenatis, cursus sem sit amet, hendrerit lorem. Donec enim lorem, elementum vitae consectetur quis, varius ac magna. Vivamus faucibus consectetur faucibus. Maecenas venenatis dui sit amet congue dignissim. Phasellus nibh elit, ultricies id hendrerit sit amet, scelerisque sit amet augue. Nam pulvinar posuere finibus. Sed rhoncus vitae enim at efficitur. Pellentesque neque eros, feugiat vel quam eget, tincidunt tempor leo. Integer quis neque sem.',
        heat: 0,
        flavor: 5,
        rating: 0
      }
    ]
)
     
  