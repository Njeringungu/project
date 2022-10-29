class FormSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :category, :status
belongs_to :charity
end
