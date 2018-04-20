# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'gabo', email: 'gabo@gmail.com', password: 'password', password_confirmation: 'password')

CreditCard.create!(name: "FinFriendicious", description: "With 3 percent cash back on all purchases, this is the best single credit card there is!", card_number: '5105105105105100', )

UserCreditCard.create!(credit_card_id: 1, user_id: 1)

Transaction.create!(user_id: 1, credit_card_id: 1, amount: 750)

User.create!(name: 'abby', email: 'abby@gmail.com', password: 'password', password_confirmation: 'password')

CreditCard.create!(name: "FinFriendicious", description: "With 3 percent cash back on all purchases, this is the best single credit card there is!", card_number: '4111111111111111')

UserCreditCard.create!(credit_card_id: 2, user_id: 2)

Transaction.create!(user_id: 2, credit_card_id: 2, amount: 500)
