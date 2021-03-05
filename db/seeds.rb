# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "山田太郎",
             email: "123@123.com",
             password:              "123123",
             password_confirmation: "123123",
             introduction: "私は山田です。",
             postcode: 1234567,
             prefecture_code: 123,
             address_city: "123",
             address_street: "123",
             address_building: "123")

User.create!(name:  "鈴木一郎",
             email: "456@456.com",
             password:              "123123",
             password_confirmation: "123123",
             introduction: "私は鈴木です。",
             postcode: 1234567,
             prefecture_code: 123,
             address_city: "123",
             address_street: "123",
             address_building: "123")

User.create!(name:  "佐藤花子",
             email: "789@789.com",
             password:              "123123",
             password_confirmation: "123123",
             introduction: "私は佐藤です。",
             postcode: 1234567,
             prefecture_code: 123,
             address_city: "123",
             address_street: "123",
             address_building: "123")

User.create!(name:  "村田剛",
             email: "abc@abc.com",
             password:              "123123",
             password_confirmation: "123123",
             introduction: "私は村田です。",
             postcode: 1234567,
             prefecture_code: 123,
             address_city: "123",
             address_street: "123",
             address_building: "123")

User.create!(name:  "大野裕子",
             email: "def@def.com",
             password:              "123123",
             password_confirmation: "123123",
             introduction: "私は大野です。",
             postcode: 1234567,
             prefecture_code: 123,
             address_city: "123",
             address_street: "123",
             address_building: "123")

Book.create!(title:  "楽しい絵本",
            body:  "楽しい絵本です",
            user_id:  "1")

Book.create!(title:  "魚の絵本",
            body:  "魚の絵本です",
            user_id:  "5")

Book.create!(title:  "料理の絵本",
            body:  "料理の絵本です",
            user_id:  "3")

Book.create!(title:  "海の絵本",
            body:  "海の絵本です",
            user_id:  "2")

Book.create!(title:  "食事の絵本",
            body:  "食事の絵本です",
            user_id:  "4")

Book.create!(title:  "山の絵本",
            body:  "山の絵本です",
            user_id:  "3")

Book.create!(title:  "空の絵本",
            body:  "空の絵本です",
            user_id:  "4")

Book.create!(title:  "電子部品の絵本",
            body:  "電子部品の絵本です",
            user_id:  "2")

Book.create!(title:  "昔の絵本",
            body:  "昔の絵本です",
            user_id:  "1")

Book.create!(title:  "楽器の絵本",
            body:  "楽器の絵本です",
            user_id:  "5")

Book.create!(title:  "パソコンの絵本",
            body:  "パソコンの絵本です",
            user_id:  "5")

Book.create!(title:  "木の絵本",
            body:  "木の絵本です",
            user_id:  "3")

Book.create!(title:  "谷の絵本",
            body:  "谷の絵本です",
            user_id:  "4")

Book.create!(title:  "ガラスの絵本",
            body:  "ガラスの絵本です",
            user_id:  "1")

Book.create!(title:  "怖い絵本",
            body:  "怖い絵本です",
            user_id:  "2")