class Donor < ApplicationRecord
      has_many :donations
      has_many :charities, through: :donations
      enum :status, { anonymous: 0, identified: 1 }
      has_secure_password
      enum :donate, { yes: 0, no: 1 }
      enum :frequency, { one_time: 0, repeat: 1 }
end
