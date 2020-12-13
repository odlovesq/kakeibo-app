class ApiController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_user!
  before_action :check_xhr_header
  rescue_from StandardError, :with => :rescue_exception

  private

  def check_xhr_header
    return if request.xhr?
    render status: :forbidden, json: { error: 'forbidden' }
  end

  def rescue_exception(e)
    @message = e.message
    @status = validate_error?(e) ? 400 : 500

    render status: @status, json: { message: @message }
  end

  def validate_error?(e)
    return e.is_a?(ActiveRecord::RecordInvalid)
  end
end
