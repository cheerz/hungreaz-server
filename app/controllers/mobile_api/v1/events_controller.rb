class MobileApi::V1::EventsController < MobileApi::V1::BaseController

  def create
    event = Event.new(event_params)
    if event.save
      event.user_events.create user: current_user
    end
    render_json event
  end

  private

  def event_params
    params.require(:event).permit(
      :start_at,
      :stop_at,
      :place_id,
    )
  end

end
