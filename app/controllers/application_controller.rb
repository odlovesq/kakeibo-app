class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, if: :devise_controller?
  before_action :check_xhr_header, if: :devise_controller?

  private

  def check_xhr_header
    return if request.xhr?
    render json: { error: 'forbidden' }, status: :forbidden
  end
end
