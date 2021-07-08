# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.create!(email: 'contateste@mail.com.br', password: '123456',
                name: 'Conta teste')

user = User.new(email: 'admin@mail.com.br', password: '123456', name: 'Admin')
user.skip_confirmation!
user.save!
