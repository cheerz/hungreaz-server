class MobileApi::V1::LoginSerializer < ActiveModel::Serializer

  self.root = false

  attributes :email, :nickname

end
