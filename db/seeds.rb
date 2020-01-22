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
             is_admin: 0
)

# # Product.create!(#product_id: "",
#                 product_name: "hoge",
#                 price: 1,
#                 discount_rate: 10,
#                 category: "弁当"
#                 amount: 1,
#                 count: "",
#                 product_img: "", 
#                 product_store: ""
# # )