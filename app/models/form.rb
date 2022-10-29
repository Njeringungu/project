class Form < ApplicationRecord
belongs_to :charity
     enum :category, {sanitary: 0, water: 1, latrine: 2 }   
    enum :status, { pending: 0, approved: 1, rejected: 2 }
end
