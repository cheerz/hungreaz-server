class MobileApi::V1::EventSerializer < ActiveModel::Serializer

  self.root = false

  attributes :id, :place_id, :start_at, :stop_at, :participants_emails

  def start_at
    object.start_at.strftime('%H:%M')
  end

  def stop_at
    object.start_at.strftime('%H:%M')
  end

  def participants_emails
    object.users.pluck(&:nickname)
  end

end
