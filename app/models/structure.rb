class Structure < ApplicationRecord
    has_and_belongs_to_many :engagements
    has_many :responsabilities
    has_many :contacts, through: :responsabilities
end
