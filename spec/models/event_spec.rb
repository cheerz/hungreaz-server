require 'spec_helper'

describe Event, type: :model do

  describe '#overlap_events' do
    let!(:place) { FactoryBot.create :place }
    let!(:event) { FactoryBot.create :event, place: place, start_at: 10.minutes.from_now, stop_at: 30.minutes.from_now }

    context 'when events do not overlap' do
      let!(:event_object) { FactoryBot.build :event, place: place, start_at: 31.minutes.from_now, stop_at: 40.minutes.from_now }

      it 'is valid' do
        expect(event_object.valid?).to be(true)
      end
    end

    context 'when events overloap after' do
      let!(:event_object) { FactoryBot.build :event, place: place, start_at: 20.minutes.from_now, stop_at: 35.minutes.from_now }

      it 'is not valid' do
        expect(event_object.valid?).to be(false)
      end
    end

    context 'when events overloap before' do
      let!(:event_object) { FactoryBot.build :event, place: place, start_at: 5.minutes.from_now, stop_at: 20.minutes.from_now }

      it 'is not valid' do
        expect(event_object.valid?).to be(false)
      end
    end
  end

end
