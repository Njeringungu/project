class CharitySerializer < ActiveModel::Serializer
 attributes :id, :name, :description, :amount_donated, :category
end
