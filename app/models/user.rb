class User < ApplicationRecord
  has_secure_password

	# Verify that email field is not blank and that it doesn't already exist in the db (prevents duplicates):
	validates :email, presence: true, uniqueness: true

	has_many :user_credit_cards
	has_many :credit_cards, through: :user_credit_cards

end
