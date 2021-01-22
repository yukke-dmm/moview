# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(name:  "森田 悠介",
             email: "morita@morita.com",
             password:              "morita",
             password_confirmation: "morita",
             admin: true)

# User.create!(name:  "morita",
#              email: "morita@morita.com",
#              employee_number: "1",
#              password:              "morita",
#              password_confirmation: "morita",
#              admin: true)
#              # activated: true,
#              # activated_at: Time.zone.now)

User.create!(name:  "山田 太郎",
             email: "yamada@yamada.com",
             employee_number: "1",
             password:              "yamada",
             password_confirmation: "yamada")
             # admin: true,
             # activated: true,
             # activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@morita.com"
  employee_number = "#{n+2}"
  password = "password"
  User.create!(name:  name,
               email: email,
               employee_number: employee_number,
               password:              password,
               password_confirmation: password)
end

10.times do |n|
  title = "タイトル#{n+1}　コース"
  introduce = "説明サンプル#{n+1}説明サンプル#{n+1}説明サンプル#{n+1}説明サンプル#{n+1}説明サンプル#{n+1}説明サンプル#{n+1}説明サンプル#{n+1}説明サンプル#{n+1}"
  Course.create!(title: title,
                 introduce: introduce,
                 admin_id: "1")
end

10.times do |n|
  title = "セクション0"
  introduce = "説明(セクション)0"
  course_id = "#{n+1}"
  Section.create!(title: title,
                  introduce: introduce,
                  course_id: course_id)
end

5.times do |n|
  title = "タイトル(セクション)#{n+1}"
  introduce = "説明(セクション)#{n+1}"
  Section.create!(title: title,
                  introduce: introduce,
                  course_id: "1")
end

15.times do |n|
  title = "レクチャー0"
  lecture_number = "#{n+1}"
  introduce = "説明(レクチャー)0"
  section_id = "#{n+1}"
  lecture_movie_url ="https://www.youtube.com/embed/N4k2SKL0vvM"
  Lecture.create!(title: title,
                  introduce: introduce,
                  lecture_number: lecture_number,
                  lecture_movie_url: lecture_movie_url,
                  section_id: section_id)
end

5.times do |n|
  title = "レクチャー#{n+1}"
  lecture_number = "#{n+1}"
  introduce = "説明(レクチャー)#{n+1}"
  lecture_movie_url ="https://www.youtube.com/embed/sk5GTStBtII"
  Lecture.create!(title: title,
                  introduce: introduce,
                  lecture_number: lecture_number,
                  lecture_movie_url: lecture_movie_url,
                  section_id: "1")
end



