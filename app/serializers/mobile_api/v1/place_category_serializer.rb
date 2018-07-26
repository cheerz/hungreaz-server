class MobileApi::V1::PlaceCategorySerializer < ActiveModel::Serializer

  self.root = false

  attributes :tag, :name

end
