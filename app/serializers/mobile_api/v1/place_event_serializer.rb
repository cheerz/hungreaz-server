class MobileApi::V1::PlaceEventSerializer < ActiveModel::Serializer

  self.root = false

  attributes :id, :start_at, :stop_at, :participants_emails

  def participants_emails
    object.users.pluck(&:nickname)
  end

end
