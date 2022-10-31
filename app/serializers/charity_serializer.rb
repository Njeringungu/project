class CharitySerializer < ActiveModel::Serializer
 attributes :id, :name, :description, :amount_donated, :category
has_many :beneficiaries
has_many :donations
end
