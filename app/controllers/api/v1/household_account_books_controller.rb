module Api::V1
  class HouseholdAccountBooksController < ApiController
    def create
      render json: { status: 'SUCCESS', data: 'hoge' }
    end
  end
end
