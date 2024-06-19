# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@admin',
  password: 'testpass'
)

Genre.create(id: 1, name: "おもちゃ")
Genre.create(id: 2, name: "室内遊具")

kotarou = User.find_or_create_by!(email: "kotarou@example.com") do |user|
  user.last_name = "てすと"
  user.first_name = "こたろう"
  user.last_name_kana = "テスト"
  user.first_name_kana = "コタロウ"
  user.password = "password"
end

nijirou = User.find_or_create_by!(email: "nijirou@example.com") do |user|
  user.last_name = "やまだ"
  user.first_name = "にじろう"
  user.last_name_kana = "ヤマダ"
  user.first_name_kana = "ニジロウ"
  user.password = "password"
end

gorou = User.find_or_create_by!(email: "gorou@example.com") do |user|
  user.last_name = "はやし"
  user.first_name = "ごろう"
  user.last_name_kana = "ハヤシ"
  user.first_name_kana = "ゴロウ"
  user.password = "password"
end

Post.find_or_create_by!(name: "歯固め") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/hagatame.jpg"), filename:"hagatame.jpg")
  post.title = "歯固めです。"
  post.body = "お気に入りの歯固めです。"
  post.genre_id = "1"
  post.user = kotarou
end

Post.find_or_create_by!(name: "音が鳴る積み木") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/tumiki.jpg"), filename:"tumiki.jpg")
  post.title = "7つ積み上げれました。"
  post.body = "3種類の音が鳴ります。"
  post.genre_id = "1"
  post.user = nijirou
end

Post.find_or_create_by!(name: "バウンサー") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/baunsa.jpg"), filename:"baunsa.jpg")
  post.title = "すぐ寝ちゃいます。"
  post.body = "バウンサーでゆられているとすぐに寝ちゃいます。"
  post.genre_id = "2"
  post.user = gorou
end