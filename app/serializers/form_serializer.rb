class FormSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :category, :status

end
