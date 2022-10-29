class BeneficiarySerializer < ActiveModel::Serializer
  attributes :name, :stories, :amount, :image
  belongs_to :charity
end
