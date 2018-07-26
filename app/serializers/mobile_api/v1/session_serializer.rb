class MobileApi::V1::SessionSerializer < ActiveModel::Serializer

  self.root = false

  attributes :email, :nickname

end
