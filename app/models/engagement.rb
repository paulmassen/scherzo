class Engagement < ApplicationRecord
    has_one :programme
    belongs_to :artiste
    has_many :partners, inverse_of: :engagement, dependent: :destroy
    has_and_belongs_to_many :structures
    has_and_belongs_to_many :contacts
    has_many :events, inverse_of: :engagement, dependent: :destroy
    accepts_nested_attributes_for :events, reject_if: :all_blank, :allow_destroy => true
    accepts_nested_attributes_for :partners, reject_if: :all_blank, :allow_destroy => true
    accepts_nested_attributes_for :structures, reject_if: :all_blank, :allow_destroy => true
end
