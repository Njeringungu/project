class Beneficiary < ApplicationRecord
    belongs_to :charity
     validates :stories, presence: true
    validates :name, presence: true
    validates :image, presence: true
end
