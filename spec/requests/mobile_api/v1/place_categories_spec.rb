require 'spec_helper'

describe MobileApi::V1::PlaceCategoriesController, type: :controller do

  describe '#index' do

    it 'renders a list of places' do
      get :index
      expect(response.response_code).to eq(200)
      expect(response_json.count).to eq(PlaceCategory.count)
    end

  end
end
