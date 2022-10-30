class DonorSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :email, :reminder, :donate, :mode_of_donation, :status, :frequency
   
end
