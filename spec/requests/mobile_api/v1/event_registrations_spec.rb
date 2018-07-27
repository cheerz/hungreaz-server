require 'spec_helper'

describe MobileApi::V1::EventRegistrationsController, type: :controller do

  let!(:place) { Place.all.sample }
  let!(:user)  { FactoryBot.create :user }
  let!(:event) { FactoryBot.create :event, place: place }

  describe '#create' do

    it 'creates a user_event' do
      set_header_session_token
      post :create, params: {event_id: event.id}
      expect(response.response_code).to eq(200)
      events = place.reload.events
      expect(events.count).to eq(1)
      expect(events.first.user_events.count).to eq(1)
      expect(events.first.user_events.first.user).to eq(user)
    end

    context 'event id does not exist' do

      it 'renders 404' do
        set_header_session_token
        post :create, params: {event_id: "WRO#{ event.id }NG"}
        expect(response.response_code).to eq(404)
      end
    end

    context 'when user is not logged in' do

      it 'renders 403' do
        post :create, params: {event_id: event.id}
      expect(response.response_code).to eq(403)
      end
    end

  end

  describe '#destroy' do
    let!(:user_event) { FactoryBot.create :user_event, user: user, event: event }

    it 'destroys a user_event' do
      set_header_session_token
      expect do
        delete :destroy, params: {event_id: event.id}
      end.to change{ UserEvent.count }.by(-1)
      expect(response.response_code).to eq(200)
    end
  end

end
