class HouseholdAccountBook < ApplicationRecord
  has_many :household_account_book_user
  has_many :users, :through => :household_account_book_user

  validates :name, presence: true, uniqueness: true
end
