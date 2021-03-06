class MobileApi::V1::UsersController < MobileApi::V1::BaseController

  skip_before_action :authenticate_user!, only: %i(create), raise: false

  def create
    user = User.new(user_params)
    if user.save
      sign_in :user, user
      after_signing_in user
    end
    render_json user
  end

  def show
    render_json current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :nickname, :sexe)
  end

end
