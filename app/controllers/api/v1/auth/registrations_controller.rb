class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  skip_before_action :verify_authenticity_token
  wrap_parameters User, include: [:name, :email, :password, :password_confirmation]

  def create
    super
  end

  private

  def sign_up_params
    params.permit(:nickname, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email)
  end
end