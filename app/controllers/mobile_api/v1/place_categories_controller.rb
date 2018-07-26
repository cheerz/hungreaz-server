class MobileApi::V1::PlaceCategoriesController < MobileApi::V1::BaseController

  def index
    render_json PlaceCategory.order(:tag).all
  end

end
