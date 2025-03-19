# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seedの実行を開始しました"

yamaguchi = Customer.find_or_create_by!(email: "adoresu@g.com") do |customer|
  customer.last_name = "山口"
  customer.first_name = "卓也"
  customer.last_name_kana = "ヤマグチ"
  customer.first_name_kana = "タクヤ"
  customer.postal_code = "7930043"
  customer.address = "愛媛"
  customer.telephone_number = "09099990000"
  customer.password = "pasuwado"
end

example = Admin.find_or_create_by!(email: "admin@example.com") do |admin|
  admin.password = "adminpasuwado"
end

puts "seedの実行が完了しました"