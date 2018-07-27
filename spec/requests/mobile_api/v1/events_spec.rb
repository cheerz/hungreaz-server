require 'spec_helper'

describe MobileApi::V1::EventsController, type: :controller do

  let!(:place) { Place.all.sample }
  let!(:user)  { User.all.sample }

  describe '#create' do
    let!(:params) {
      {
        event: {
          start_at:   1.hour.from_now,
          stop_at:    2.hour.from_now,
          place_id:   place.id,
          user_email: user.email,
        }
      }
    }

    it 'creates an event' do
      post :create, params: params
      expect(response.response_code).to eq(200)
      events = place.reload.events
      expect(events.count).to eq(1)
      expect(events.first.user_events.count).to eq(1)
      expect(events.first.user_events.first.user).to eq(user)
    end

  end

end
