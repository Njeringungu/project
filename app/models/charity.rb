class Charity < ApplicationRecord
     has_secure_password


    has_many :donations
    has_many :donors, through: :donations
    has_many :beneficiaries
has_many :forms

    # validates :email, presence: true
    # validates :password, presence: true
    # validates :name, presence: true

     enum :category, {sanitary: 0, water: 1, latrine: 2 }   
    enum :status, { pending: 0, approved: 1, rejected: 2 }
end
