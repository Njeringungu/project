class Donor < ApplicationRecord
      has_many :donations
      has_many :charities, through: :donations
has_secure_password
      validates :email, presence: true
    validates :password, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :description, presence: true
      enum :status, { anonymous: 0, identified: 1 }
      
      enum :donate, { yes: 0, no: 1 }
      enum :frequency, { one_time: 0, repeat: 1 }
end
