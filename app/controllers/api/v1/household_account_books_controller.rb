module Api::V1
  class HouseholdAccountBooksController < ApiController
    def create
      household_account_book = HouseholdAccountBook.new(household_account_book_params.merge(user_ids: current_user.id))
      household_account_book.save!
      render status: 201, json: household_account_book
    end

    private

    def household_account_book_params
      params.permit(:name)
    end
  end
end
