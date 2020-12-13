class HouseholdAccountBookUser < ApplicationRecord
  belongs_to :user
  belongs_to :household_account_book
end
