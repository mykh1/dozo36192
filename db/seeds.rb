# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  employee_number: "a123456",
  last_name: "山田", 
  first_name: "太郎", 
  last_name_reading: "ヤマダ", 
  first_name_reading: "タロウ", 
  nickname: "タロウ", 
  email: "a@com", 
  admin: true,
  password: "a123456"
)
