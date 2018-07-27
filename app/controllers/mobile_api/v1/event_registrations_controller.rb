class MobileApi::V1::EventRegistrationsController < MobileApi::V1::BaseController

  before_action :find_event

  def create
    user_event = @event.user_events.new(user: current_user)
    if user_event.save
      render_json @event, MobileApi::V1::EventSerializer
    else
      render_error :unprocessable_entity, user_event.errors.full_messages
    end
  end

  def destroy
    user_event = @event.user_events.find_by(user: current_user)
    if user_event
      user_event.destroy
      render_json @event, MobileApi::V1::EventSerializer
    else
      render_error :not_found
    end
  end

  private

  def find_event
    @event = Event.find_by(id: params[:event_id])
    unless @event
      render_error :not_found
    end
  end

end
