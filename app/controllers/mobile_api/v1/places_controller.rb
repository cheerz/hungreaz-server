class MobileApi::V1::PlacesController < MobileApi::V1::BaseController

  DEFAULT_METER_DISTANCE = 500

  before_action :check_parameters, only: %i(index)

  rescue_from(ApplicationError::MissingParameter) do
    render_error :unprocessable_entity, t('errors.missing_parameter')
  end

  def index
    places = Place.within(km_distance_param, origin: position_params)
    render_json places
  end

  def create
    place = Place.new(place_params)
    if place.save
      render_json place
    else
      render_error :unprocessable_entity
    end
  end

  def km_distance_param
    meter_distance = params[:meter_distance].to_i || DEFAULT_DISTANCE
    meter_distance / 1000.0
  end

  private

  def position_params
    params.slice(:lat, :lng).values
  end

  def place_params
    params.require(:place).permit(
      :name,
      :lng,
      :lat,
      :first_image_url,
      :second_image_url,
      :third_image_url,
      :fourth_image_url,
      :fifth_image_url,
    )
  end

  def check_parameters
    unless params[:lat].present? && params[:lng].present?
      raise ApplicationError::MissingParameter
    end
  end

end
