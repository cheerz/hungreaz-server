class MobileApi::V1::PlaceSerializer < ActiveModel::Serializer

  self.root = false

  attributes :name, :lng, :lat, :address, :first_image_url, :second_image_url,
             :third_image_url, :fourth_image_url, :fifth_image_url, :user_email,
             :place_category_name, :events

  def events
    object.events.future.map do |event|
      MobileApi::V1::EventSerializer.new(event)
    end
  end

end
