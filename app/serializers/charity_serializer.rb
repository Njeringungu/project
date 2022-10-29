class CharitySerializer < ActiveModel::Serializer
 attributes :name, :description, :amount_donated, :category
end
