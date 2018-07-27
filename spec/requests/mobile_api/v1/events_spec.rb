require 'spec_helper'

describe MobileApi::V1::EventsController, type: :controller do

  let!(:place) { FactoryBot.create :place }
  let!(:user)  { FactoryBot.create :user }

  describe '#create' do
    let!(:params) {
      {
        event: {
          start_at:   1.hour.from_now.strftime('%H:%M'),
          stop_at:    2.hour.from_now.strftime('%H:%M'),
          place_id:   place.id,
        }
      }
    }

    it 'creates an event' do
      set_header_session_token
      post :create, params: params
      expect(response.response_code).to eq(200)
      events = place.reload.events
      expect(events.count).to eq(1)
      expect(events.first.user_events.count).to eq(1)
      expect(events.first.user_events.first.user).to eq(user)
    end

    context 'when overlaping with an existing event' do
      let!(:event) { FactoryBot.create :event, place: place, start_at: 10.minutes.from_now, stop_at: 30.minutes.from_now }
      let!(:params) {
        {
          event: {
            start_at:   20.minutes.from_now.strftime('%H:%M'),
            stop_at:    40.minutes.from_now.strftime('%H:%M'),
            place_id:   place.id,
          }
        }
      }

      it 'renders 422' do
        set_header_session_token
        post :create, params: params
        expect(response.response_code).to eq(422)
      end
    end

  end

end
