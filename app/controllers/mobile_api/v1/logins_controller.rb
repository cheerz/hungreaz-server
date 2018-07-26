class MobileApi::V1::LoginsController < MobileApi::V1::BaseController

  skip_before_action :authenticate_user!

  def create
    user = User.find_by(email: email_param)
    if user&.valid_password?(password_param)
      sign_in :user, user
      render_json user
    else
      render_json nil
    end
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
