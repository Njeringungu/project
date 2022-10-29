class DonationSerializer < ActiveModel::Serializer
  attributes :amount
  belongs_to :charity
  belongs_to :donor
end
