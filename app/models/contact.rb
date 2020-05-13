class Contact < ApplicationRecord
    has_many :responsabilities
    include PgSearch::Model
    pg_search_scope :search_by_name, against: [:name, :surname], using: {tsearch: {prefix: true}}
    has_many :structures, through: :responsabilities, dependent: :destroy
    has_and_belongs_to_many :engagements
end
