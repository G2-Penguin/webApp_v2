# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(user_id: "admin1",
             admin_name: "admin1",
             store_id: "1",
             password: "admin1",
             is_admin: 1
)

User.create!(user_id: "admin2",
             admin_name: "admin2",
             store_id: "2",
             password: "admin2",
             is_admin: 1
)

User.create!(user_id: "admin3",
             admin_name: "admin3",
             store_id: "3",
             password: "admin3",
             is_admin: 1
)

User.create!(user_id: "admin4",
             admin_name: "admin4",
             store_id: "4",
             password: "admin4",
             is_admin: 1
)

User.create!(user_id: "hoge",
             admin_name: "hoge",
             store_id: "1",
             password: "hoge",
            # is_admin: 0
)

Product.create!(product_id: 1,
                product_name: "hoge",
                price: 1,
                discount_rate: 10,
                category: "弁当",
                amount: "1g",
                count: 1,
                product_img: 1001, 
                product_store: "1"
)

Category.create!(category_id: 1,
                  category_name: "弁当"
)

Category.create!(category_id: 2,
                  category_name: "惣菜"
)

Category.create!(category_id: 3,
                  category_name: "生鮮食品"
)

Store.create!(store_id: "1",
              store_name: "tosa",
              address: "tosa",
              tel_number: 000,
              hp_url: rerefdfd,
              store_image: fafasd
)