# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "morita",
             email: "morita@morita.com",
             employee_number: "1",
             password:              "morita",
             password_confirmation: "morita",
             admin: true)
             # activated: true,
             # activated_at: Time.zone.now)

User.create!(name:  "yamada",
             email: "yamada@yamada.com",
             employee_number: "2",
             password:              "yamada",
             password_confirmation: "yamada")
             # admin: true,
             # activated: true,
             # activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@morita.com"
  employee_number = "#{n+3}"
  password = "password"
  User.create!(name:  name,
               email: email,
               employee_number: employee_number,
               password:              password,
               password_confirmation: password)
end

4.times do |n|
  title = "タイトルサンプル#{n+1}"
  introduce = "説明サンプル#{n+1}"
  Course.create!(title: title,
                 introduce: introduce,
                 user_id: "1")
end