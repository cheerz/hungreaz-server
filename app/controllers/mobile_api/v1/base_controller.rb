class MobileApi::V1::BaseController < ApplicationController

  include Concerns::SerializationConcern

  def model_serializer
    "MobileApi::#{ controller_version.classify }::#{ controller_name.classify }Serializer".constantize
  end

  private

  def controller_version
    'v1'
  end

end
