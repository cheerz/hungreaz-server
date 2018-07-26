class MobileApi::V1::SessionsController < MobileApi::V1::BaseController

  include Concerns::SerializationConcern

  skip_before_action :authenticate_user!, only: %i(create), raise: false

  def create
    user = User.find_by(email: email_param)
    if user&.valid_password?(password_param)
      sign_in :user, user
      after_signing_in user
      render_json user, MobileApi::V1::UserSerializer
    else
      render_json nil
    end
  end

  def destroy
    sign_out current_user
    current_user.reset_session_token!
    head :ok
  end

  private

  def email_param
    user_params[:email]
  end

  def password_param
    user_params[:password]
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
