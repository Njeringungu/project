class Donor < ApplicationRecord
      has_many :donations
    has_many :charities, through: :donations
  enum :status, { anonymous: 0, identified: 1 }
    has_secure_password
end
