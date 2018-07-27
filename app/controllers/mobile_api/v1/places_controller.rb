class MobileApi::V1::PlacesController < MobileApi::V1::BaseController

  before_action :check_parameters, only: %i(index)

  rescue_from(ApplicationError::MissingParameter) do
    render_error :unprocessable_entity, t('errors.missing_parameter')
  end

  def index
    places = Place.within_distance(params[:meter_distance]&.to_i, position_params)
    render_json places
  end

  def create
    place = current_user.places.new(place_params)
    if place.save
      render_json place
    else
      render_error :unprocessable_entity
    end
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
      :address,
      :first_image_url,
      :second_image_url,
      :third_image_url,
      :fourth_image_url,
      :fifth_image_url,
      :place_category_tag,
    )
  end

  def check_parameters
    unless params[:lat].present? && params[:lng].present?
      raise ApplicationError::MissingParameter
    end
  end

end
