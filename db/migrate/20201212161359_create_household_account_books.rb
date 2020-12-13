class CreateHouseholdAccountBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :household_account_books do |t|
      t.string :name
      t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
      t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }
      t.datetime "deleted_at"
    end
    add_index :household_account_books, :name, :unique => true

    create_table :household_account_book_users do |t|
      t.belongs_to :user
      t.belongs_to :household_account_book
    end
  end
end
