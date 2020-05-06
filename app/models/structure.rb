class Structure < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :search_by_title, against: :title, using: {tsearch: {prefix: true}}
    has_and_belongs_to_many :engagements
    has_many :responsabilities
    has_many :contacts, through: :responsabilities
end
