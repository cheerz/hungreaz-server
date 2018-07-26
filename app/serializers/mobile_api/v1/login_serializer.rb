class MobileApi::V1::LoginSerializer < ActiveModel::Serializer

  self.root = false

  attributes :email, :first_name, :last_name

end
