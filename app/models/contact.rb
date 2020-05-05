class Contact < ApplicationRecord
    has_many :responsabilities
    has_many :structures, through: :responsabilities
end
