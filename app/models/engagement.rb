class Engagement < ApplicationRecord
    has_one :programme
    belongs_to :artiste
    has_many :events, inverse_of: :engagement, dependent: :destroy
    accepts_nested_attributes_for :events, reject_if: :all_blank, :allow_destroy => true
    
end
