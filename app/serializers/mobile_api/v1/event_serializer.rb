class MobileApi::V1::EventSerializer < ActiveModel::Serializer

  self.root = false

  attributes :start_at, :stop_at, :participants_emails

  def participants_emails
    object.users.pluck(&:nickname)
  end

end
