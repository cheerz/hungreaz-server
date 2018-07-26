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
    let!(:place_user)       { FactoryBot.create :user }
    let!(:place_category)   { PlaceCategory[:food] }
    let!(:place_object)     { FactoryBot.build :place, place_category: place_category }
    let!(:place_attributes) { place_object.attributes.slice *%w(name lng lat address first_image_url second_image_url third_image_url fourth_image_url fifth_image_url) }

    it 'creates a new place' do
      post :create, params: {place: place_attributes.merge(user_email: place_user.email, place_category_tag: place_category.tag)}
      expect(response_json).to include(place_attributes)
      expected_place = Place.find_by(name: place_object.name)
      expect(expected_place).not_to be(nil)
      expect(response_json['user_email']).to eq(place_user.email)
      expect(response_json['place_category_name']).to eq(place_category.name)
    end
  end
end
