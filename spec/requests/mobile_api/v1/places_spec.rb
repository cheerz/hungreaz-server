require 'spec_helper'

describe MobileApi::V1::PlacesController, type: :controller do

  let!(:place) { Place.find_by name: 'Cheerz Palace' }

  describe '#index' do
    let!(:user)  { FactoryBot.create :user }
    let!(:event) { FactoryBot.create :event, place: place }
    let!(:ue)    { FactoryBot.create :user_event, event: event, user: user }

    it 'renders a list of places' do
      get :index, params: {meter_distance: 10, lng: place.lng, lat: place.lat}
      expect(response.response_code).to eq(200)
      expect(response_json.first['name']).to eq(place.name)
      expect(response_json.first['events'].count).to eq(1)
    end

    context 'when some params are missing' do

      it 'renders a 422' do
        get :index, params: {meter_distance: 10, lng: place.lng}
        expect(response.response_code).to eq(422)
      end
    end
  end

  describe '#create' do
    let!(:place_object)     { FactoryBot.build :place }
    let!(:place_attributes) { place_object.attributes.slice *%w(name lng lat first_image_url second_image_url third_image_url fourth_image_url fifth_image_url) }

    it 'creates a new place' do
      post :create, params: {place: place_attributes}
      expect(response_json).to include(place_attributes)
    end
  end
end
