module Api::V1
  class HouseholdAccountBooksController < ApiController
    def create
      householdAccountBook = HouseholdAccountBook.new(household_account_book_params.merge(user_ids: current_user.id))
      householdAccountBook.save!
      render status: 201, json: householdAccountBook
    end

    private

    def household_account_book_params
      params.permit(:name)
    end
  end
end
