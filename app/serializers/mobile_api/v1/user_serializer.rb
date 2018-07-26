class MobileApi::V1::UserSerializer < ActiveModel::Serializer

  self.root = false

  attributes :email, :nickname, :sexe

end
