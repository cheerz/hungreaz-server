class MobileApi::V1::BaseController < ApplicationController

  include Concerns::SerializationConcern

  before_action :authenticate_user!

  def model_serializer
    "MobileApi::#{ controller_version.classify }::#{ controller_name.classify }Serializer".constantize
  end

  def after_signing_in user
    user.set_session_token!
    set_header_session_token user
  end

  def set_header_session_token user
    response.headers['SESSION-TOKEN'] = user.session_token
  end

  def authenticate_user!
    unless current_user
      unless request.headers['SESSION-TOKEN'].nil? || User.find_by(session_token: request.headers['SESSION-TOKEN'])
        render_error :forbidden
      end
    end
  end

  def current_user
    if request.headers['SESSION-TOKEN'].present?
      @current_user ||= (super || User.find_by(session_token: request.headers['SESSION-TOKEN']))
    end
  end

  private

  def controller_version
    'v1'
  end

end
