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
    ).tap do |whitelisted|
      whitelisted[:start_at] = whitelisted[:start_at].to_time
      whitelisted[:stop_at]  = whitelisted[:stop_at].to_time
    end
  end

end
